//%attributes = {}
#DECLARE($doc : Text)
$0:="<body>\n"+\
"<div id='content' class='container'>\n\n"+$doc+"</div>\n"+\
"    <script>\n"+\
"      document.getElementById('content').innerHTML =\n"+\
"      marked(document.getElementById('content').innerHTML);\n"+\
"</script>\n"+\
"</body>\n"