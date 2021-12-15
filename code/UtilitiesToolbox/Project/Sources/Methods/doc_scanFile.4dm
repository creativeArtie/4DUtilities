//%attributes = {}
#DECLARE($fileParam : 4D:C1709.File; $hasAttrParam : Boolean)->$data : cs:C1710.RawFile

// List of watching varibles
// $lines.length
// $row
// $state
// $code
// $comment
// $doc
// $rawAttr
// Substring($text;$ptr)
// Line breaks: 67, 205

var $lines : Collection
$lines:=New collection:C1472

var $assert : Object
$assert:=wk_assertParameterSetup(Count parameters:C259)
var $file : 4D:C1709.File
If (wk_assertLocalParameter($assert; ->$file; File:C1566(Backup log file:K5:45)))
	$file:=$fileParam
Else 
	$file:=File:C1566(\
		doc_toFolderSource("Methods").path+"test_parser.4dm"; fk posix path:K87:1)
End if 

var $hasAttr
If (wk_assertLocalParameter($assert; ->$hasAttr; False:C215))
	$hasAttr:=$hasAttrParam
End if 

wk_assertParameterCount($assert)

var $BEGIN; $ATTR_START; $ATTR_END; \
$CODE_PARSED; $CODE_ESCAPE; $STRING_TEXT; \
$STRING_ESC; $CODE_SLASH; \
$COMMENT_START; $COMMENT_TEXT; $COMMENT_DOC; \
$MULTI_START; $MULTI_TEXT; $MULTI_TEXT_END; \
$MULTI_DOC; $MULTI_DOC_END : Integer

$BEGIN:=Get call chain:C1662[0].line
$ATTR_START:=Get call chain:C1662[0].line
$ATTR_END:=Get call chain:C1662[0].line

$CODE_PARSED:=Get call chain:C1662[0].line
$CODE_ESCAPE:=Get call chain:C1662[0].line
$STRING_TEXT:=Get call chain:C1662[0].line
$STRING_ESC:=Get call chain:C1662[0].line

$CODE_SLASH:=Get call chain:C1662[0].line

$COMMENT_START:=Get call chain:C1662[0].line
$COMMENT_TEXT:=Get call chain:C1662[0].line
$COMMENT_DOC:=Get call chain:C1662[0].line
$MULTI_START:=Get call chain:C1662[0].line
$MULTI_TEXT:=Get call chain:C1662[0].line
$MULTI_TEXT_END:=Get call chain:C1662[0].line
$MULTI_DOC:=Get call chain:C1662[0].line
$MULTI_DOC_END:=Get call chain:C1662[0].line

var $state; $ptr : Integer
If ($hasAttr)
	$state:=$BEGIN
Else 
	$state:=$CODE_PARSED
End if 

var $attributes : Object
var $text : Text
$text:=Replace string:C233($file.getText(); "\r"; "")

var $code; $comment; $doc : Text
var $row : Integer
$code:=""
$comment:=""
$doc:=""
$row:=0

var $newLine : Boolean
var $rawAttrs : Text
For ($ptr; 1; Length:C16($text))
	var $char : Text
	$char:=Substring:C12($text; $ptr; 1)
	$newLine:=False:C215
	Case of 
		: ($state=$BEGIN)
			//! - Search for attributes
			If ($char="{")
				$state:=$ATTR_START
				$rawAttrs:="{"
			End if 
			
		: ($state=$ATTR_START)
			//! Extract the attributes
			$rawAttrs:=$rawAttrs+$char
			If ($char="}")
				$state:=$ATTR_END
				$attributes:=JSON Parse:C1218($rawAttrs)
			End if 
			
		: ($state=$ATTR_END)
			//! - Search for the code
			If ($char="\n")
				$state:=$CODE_PARSED
			End if 
			
		: ($state=$CODE_PARSED)
			//! - extract the code
			var $continue : Boolean
			$continue:=True:C214
			Case of 
				: ($char="\\")  // escape
					$state:=$CODE_ESCAPE
				: ($char="\"")  // string
					$state:=$STRING_TEXT
				: ($char="/")  // comment
					$state:=$CODE_SLASH
					$continue:=False:C215
				: ($char="\n")  // new line
					$continue:=False:C215
					$newLine:=True:C214
			End case 
			// More steps
			If ($continue)
				$code:=$code+$char
			End if 
		: ($state=$CODE_ESCAPE)
			// parse escape
			$code:=$code+$char
			$state:=$CODE_PARSED
			
		: ($state=$STRING_TEXT)
			//! - parse string
			Case of 
				: ($char="\\")
					$state:=$STRING_ESC
				: ($char="\"")
					$state:=$CODE_PARSED
			End case 
			$code:=$code+$char
		: ($state=$STRING_ESC)
			$state:=$STRING_TEXT
			$code:=$code+$char
			
		: ($state=$CODE_SLASH)
			Case of 
				: ($char="/")
					// single line comment
					$state:=$COMMENT_START
				: ($char="*")
					//multiline comment
					$state:=$MULTI_START
				Else 
					// divide
					$code:=$code+"/"+$char
					$state:=$CODE_PARSED
			End case 
			
		: ($state=$COMMENT_START)
			If ($char="!")
				$state:=$COMMENT_DOC
			Else 
				$state:=$COMMENT_TEXT
				$comment:=$comment+$char
			End if 
		: ($state=$COMMENT_TEXT)
			If ($char="\n")
				$state:=$CODE_PARSED
				$newLine:=True:C214
			Else 
				$comment:=$comment+$char
			End if 
		: ($state=$COMMENT_DOC)
			If ($char="\n")
				$newLine:=True:C214
				$state:=$CODE_PARSED
			Else 
				$doc:=$doc+$char
			End if 
			
		: ($state=$MULTI_START)
			Case of 
				: ($char="!")
					$state:=$MULTI_DOC
				: ($char="*")
					$state:=$MULTI_DOC
				Else 
					$state:=$MULTI_TEXT
					$comment:=$comment+$char
			End case 
		: ($state=$MULTI_DOC)
			If ($char="*")
				$state:=$MULTI_DOC_END
			Else 
				$doc:=$doc+$char
			End if 
		: ($state=$MULTI_DOC_END)
			If ($char="/")
				$state:=$CODE_PARSED
			Else 
				$state:=$MULTI_DOC
				$doc:=$doc+"*"+$char
			End if 
			
		: ($state=$MULTI_TEXT)
			If ($char="*")
				$state:=$MULTI_TEXT_END
			Else 
				$comment:=$comment+$char
			End if 
			
		: ($state=$MULTI_TEXT_END)
			If ($char="/")
				$state:=$CODE_PARSED
			Else 
				$state:=$MULTI_TEXT
				$comment:=$comment+"*"+$char
			End if 
	End case 
	
	If ($newLine)
		If (($code#"") | ($comment#"") | ($doc#""))
			$lines.push(cs:C1710.RawLine.new($code; $comment; $doc; $row))
		End if 
		$code:=""
		$comment:=""
		$doc:=""
		$row:=$row+1
	End if 
End for 

$data:=cs:C1710.RawFile.new($file; $attributes; $lines)