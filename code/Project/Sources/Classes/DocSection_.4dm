Class constructor
	This:C1470.brief:=""
	This:C1470.declare:=""
	This:C1470.comments:=New collection:C1472
	This:C1470.type:=""
	This:C1470.text_:=""
	This:C1470.local:=New collection:C1472
	
Function setPrivate_
	//! #brief check if the name ends with "_" meaning private
	If (This:C1470.name="@_")
		This:C1470.type:="private"
	End if 
	
Function paraseCommonTags($comment : cs:C1710.DocLine_; $common : cs:C1710.DocCommon_)
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
				: (doc_buildValue_($comment; This:C1470))
				Else 
					$common.addCode($comment; This:C1470)
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