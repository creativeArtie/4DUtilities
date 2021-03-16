//%attributes = {}
#DECLARE($doc : cs:C1710.DocSection_; $comment : cs:C1710.Comment_)

Case of 
	: ($comment.tag="brief")
		$doc.brief:=$comment.doc
	: ($comment.tag="author")
		$doc.author:=$comment.doc
	: ($comment.tag="param")
		var $name : Text
		var $brief : Text
		If (Match regex:C1019(".* .*"; $comment.doc))
			var $pos : Integer
			$pos:=Position:C15(" "; $comment.doc)
			$name:=Substring:C12($comment.doc; 0; $pos-1)
			$brief:=Substring:C12($comment.doc; $pos+1)
		Else 
			$name:=$comment.doc
		End if 
		$doc.params.push(cs:C1710.DocParam_.new($name; $brief))
	Else 
		$doc.comments.push($comment.doc)
End case 