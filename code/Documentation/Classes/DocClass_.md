<!DOCTYPE html>
<!---->
<html>
<header>
  <script src='https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/marked/marked.min.js'></script>
  <link 
    href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css'
    rel='stylesheet'
    integrity='sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl'
    crossorigin='anonymous'
  >
  <script 
    src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js'
    integrity='sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0'
    crossorigin='anonymous'
  ></script>
  <title>Class DocClass_</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.DocClass_</mark> <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
</h1>

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classDocSection_[cs.DocSection_]
    classDocSection_ --> classDocFile_
    classDocFile_[cs.DocFile_]
    classDocFile_ --> classDocClass_
    classDocClass_([Current Class: cs.DocClass_])
    classDocClass_ --> classDocMethod_
    classDocMethod_[cs.DocMethod_]
    classDocFile_ --> classDocCommon_
    classDocCommon_[cs.DocCommon_]
    classDocSection_ --> classDocFunction_
    classDocFunction_[cs.DocFunction_]

</pre>



<h2>Method list</h2>

<table class='table-hover'>
  <thead>
  <tr>
  <th>Method Name</th>
  <th>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-success'>
<a href='#class-constructor'><strong>Class constructor($name : Text; $path : cs.File; $common : cs.DocCommon_)<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#getFile'>getFile() -> $file : 4D.File</a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#generateText'>generateText()</a>
</td>
    <td class='table-success'>
print the class
</td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='class-constructor'><strong>Class Constructor</strong></h3>

<table class=''>
  <thead>
  <tr>
  <th>Name</th>
  <th>Type</th>
  <th>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>
$name (parameter 1)
</td>
    <td class='table-primary'>
Text
</td>
    <td class='table-primary'>
<em>Declared on line 2.</em>
</td>
  </tr>
  <tr>
    <td class='table-primary'>
$path (parameter 2)
</td>
    <td class='table-primary'>
cs.File
</td>
    <td class='table-primary'>
<em>Declared on line 2.</em>
</td>
  </tr>
  <tr>
    <td class='table-primary'>
$common (parameter 3)
</td>
    <td class='table-primary'>
cs.DocCommon_
</td>
    <td class='table-primary'>
<em>Declared on line 2.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$count
</td>
    <td class='table-info'>
Real
</td>
    <td class='table-info'>
<em>Declared on line 6.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$details
</td>
    <td class='table-info'>
cs.DocClass_
</td>
    <td class='table-info'>
<em>Declared on line 14.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$comments
</td>
    <td class='table-info'>
Collection
</td>
    <td class='table-info'>
<em>Declared on line 15.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$parsed
</td>
    <td class='table-info'>
cs.DocLine_
</td>
    <td class='table-info'>
<em>Declared on line 18.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$function
</td>
    <td class='table-info'>
cs.DocFunction_
</td>
    <td class='table-info'>
<em>Declared on line 19.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='getFile'>getFile</h3>

<table class=''>
  <thead>
  <tr>
  <th>Name</th>
  <th>Type</th>
  <th>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>
$file (return value)
</td>
    <td class='table-secondary'>
4D.File
</td>
    <td class='table-secondary'>
<em>Declared on line 55.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$path
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
<em>Declared on line 56.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='generateText'>generateText</h3>

<table class=''>
  <thead>
  <tr>
  <th>Name</th>
  <th>Type</th>
  <th>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-info'>
$text
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
<em>Declared on line 65.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$classDoc
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
<em>Declared on line 66.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$commentLine
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
<em>Declared on line 67.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$htmlTable
</td>
    <td class='table-info'>
cs.DocHtmlTable_
</td>
    <td class='table-info'>
<em>Declared on line 82.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$function
</td>
    <td class='table-info'>
cs.DocFunction_
</td>
    <td class='table-info'>
<em>Declared on line 83.</em>
</td>
  </tr>
</tbody>
</table>

print the class


</div>
  <script>
    document.getElementById('content').innerHTML =
    marked(document.getElementById('content').innerHTML);
    mermaid.initialize({startOnLoad:true});
    var nodes = document.querySelectorAll('#content table');
    var i;
    for (i=0; i< nodes.length; i++){
      nodes[i].className=nodes[i].className+' table'; 
    }
  </script>
</body>
</html>