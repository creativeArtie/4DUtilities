Class constructor
	This:C1470.brief:=""
	This:C1470.comments:=New collection:C1472
	This:C1470.type:=""
	This:C1470.text_:=""
	This:C1470.local:=New collection:C1472
	
Function setPrivate_
	/// #brief check if the name ends with "_" meaning private
	If (This:C1470.name="@_")
		This:C1470.type:="private"
	End if 
	
Function paraseCommonTags($comment : cs:C1710.DocLine_)
	Case of 
		: ($comment.tag="brief")
			This:C1470.brief:=$comment.doc
			
		: ($comment.tag="author")
			This:C1470.author:=$comment.doc
			
			//: ($comment.tag="param")
			//var $name : Text
			//var $brief : Text
			//If (Match regex(".* .*"; $comment.doc))
			//var $pos : Integer
			//$pos:=Position(" "; $comment.doc)
			//$name:=Substring($comment.doc; 0; $pos-1)
			//$brief:=Substring($comment.doc; $pos+1)
			//Else 
			//$name:=$comment.doc
			//End if 
			//This.params.push(cs.DocParam_.new($name); $brief)
		Else 
			var $pos : Integer
			var $len : Integer
			Case of 
				: (Match regex:C1019("[\t]*var[:space:]"; $comment.code; 1; $pos; $len))
					var $raw : Text
					$raw:=Substring:C12($comment.code; $len+1)
					Case of 
						: (Match regex:C1019("\\$[0-9]+"; $raw))
						: (Match regex:C1019("\\$[:alpha:].*"; $raw))
							var $value : cs:C1710.DocValue_
							$value:=cs:C1710.DocValue_.new($comment; $raw)
							$value.brief:=$comment.doc
							This:C1470.local.push($value)
					End case 
					
				: (Match regex:C1019("[\t]*C_.+\\(.+\\)"; $comment.code; 1; $pos; $len))
					If ($pos=1)
						C_LONGINT:C283($start; $end)  /// Start and end of the match
						C_BOOLEAN:C305($match)  /// use to make Match regex happy
						$match:=Match regex:C1019("[\t]*C_"; $comment.code; 1; $start; $end)
						$raw:=Substring:C12($comment.code; $end+1; Length:C16($comment.code)-$end-1)
						var $split : Collection
						$split:=Split string:C1554($raw; ":")
						var $type : Text
						$type:=$split[0]
						$split:=Split string:C1554($split[1]; "(")
						$split:=Split string:C1554($split[1]; ";")
						var $name : Text
						For each ($name; $split)
							$value:=cs:C1710.DocValue_.new($comment; $name; $type)
							$value.brief:=$comment.doc
							This:C1470.local.push($value)
						End for each 
					End if 
					
				Else 
					This:C1470.comments.push($comment.doc)
			End case 
	End case 
	
Function getTypeBadge->$badge : Text
	Case of 
		: (This:C1470.type="constructor")
			$0:=doc_outputBadge_("bg-primary"; "Class Constructor"; "constructor")
			
		: (This:C1470.type="abstract")
			$0:=doc_outputBadge_("bg-warning"; "Needs implementation in subclass"; \
				"abstract")+"\n"
			
		: (This:C1470.type="private")
			$0:=doc_outputBadge_("bg-danger"; "To be use internally in a namespace"; \
				"private")+"\n"
		Else 
			$0:=""
	End case 