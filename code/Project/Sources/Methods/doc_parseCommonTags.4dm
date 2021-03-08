//%attributes = {}
#DECLARE($doc : cs:C1710.DocSection_; $comment : cs:C1710.Comment_)

Case of 
	: ($comment.tag="brief")
		$doc.brief:=$comment.doc
	: ($comment.tag="param")
		
	Else 
		$doc.comments.push($comment.doc)
End case 