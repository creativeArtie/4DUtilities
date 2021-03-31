<!DOCTYPE html>
<!--create a file for the 4D Documentation and for browser-->
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
  <title>Class DocFile_</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.DocFile_</mark> <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
</h1>

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classDocSection_[cs.DocSection_]
    classDocSection_ --> classDocFile_
    classDocFile_([Current Class: cs.DocFile_])
    classDocFile_ --> classDocClass_
    classDocClass_[cs.DocClass_]
    classDocClass_ --> classDocMethod_
    classDocMethod_[cs.DocMethod_]
    classDocFile_ --> classDocCommon_
    classDocCommon_[cs.DocCommon_]
    classDocSection_ --> classDocFunction_
    classDocFunction_[cs.DocFunction_]

</pre>

create a file for the 4D Documentation and for browser

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
<a href='#class-constructor'><strong>Class constructor()<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-warning'>
<a href='#generateText'><em>generateText() -> $text : Text</em> <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</a>
</td>
    <td class='table-warning'>

</td>
  </tr>
  <tr>
    <td class='table-warning'>
<a href='#getFile'><em>getFile() -> $file : 4D.File</em> <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</a>
</td>
    <td class='table-warning'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#generate'>generate()</a>
</td>
    <td class='table-success'>
generate the file
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#addDescription'>addDescription()</a>
</td>
    <td class='table-success'>
add the file discription
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#addHeading'>addHeading($header : Text; $level : Integer; $id : Text; $withSummary : Boolean) -> $answer : Text</a>
</td>
    <td class='table-success'>
helper function for adding a markdown header
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#addLine'>addLine($line : Text)</a>
</td>
    <td class='table-success'>
helper function for adding a markdown paragraph
</td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='class-constructor'><strong>Class Constructor</strong></h3>



<h3 id='generateText'>generateText <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</h3>

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
$text (return value)
</td>
    <td class='table-secondary'>
Text
</td>
    <td class='table-secondary'>
<em>Declared on line 7.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='getFile'>getFile <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</h3>

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
<em>Declared on line 9.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='generate'>generate</h3>

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
$file
</td>
    <td class='table-info'>
4D.File
</td>
    <td class='table-info'>
 the generated file<br /><em>Declared on line 13.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$text
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
 parsed text<br /><em>Declared on line 20.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$template
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
 parsing template<br /><em>Declared on line 21.</em>
</td>
  </tr>
</tbody>
</table>

generate the file

<h3 id='addDescription'>addDescription</h3>

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
$line
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
 a single line from `This.comments` loop<br /><em>Declared on line 32.</em>
</td>
  </tr>
</tbody>
</table>

add the file discription

<h3 id='addHeading'>addHeading</h3>

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
$header (parameter 1)
</td>
    <td class='table-primary'>
Text
</td>
    <td class='table-primary'>
<em>Declared on line 37.</em>
</td>
  </tr>
  <tr>
    <td class='table-primary'>
$level (parameter 2)
</td>
    <td class='table-primary'>
Integer
</td>
    <td class='table-primary'>
<em>Declared on line 37.</em>
</td>
  </tr>
  <tr>
    <td class='table-primary'>
$id (parameter 3)
</td>
    <td class='table-primary'>
Text
</td>
    <td class='table-primary'>
<em>Declared on line 37.</em>
</td>
  </tr>
  <tr>
    <td class='table-primary'>
$withSummary (parameter 4)
</td>
    <td class='table-primary'>
Boolean
</td>
    <td class='table-primary'>
<em>Declared on line 37.</em>
</td>
  </tr>
  <tr>
    <td class='table-secondary'>
$answer (return value)
</td>
    <td class='table-secondary'>
Text
</td>
    <td class='table-secondary'>
<em>Declared on line 37.</em>
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
<em>Declared on line 40.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$idAttr
</td>
    <td class='table-info'>
Text
</td>
    <td class='table-info'>
 id attribute which can be linked from the "Method list" section.<br /><em>Declared on line 47.</em>
</td>
  </tr>
</tbody>
</table>

helper function for adding a markdown header

<h3 id='addLine'>addLine</h3>

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
$line (parameter 1)
</td>
    <td class='table-primary'>
Text
</td>
    <td class='table-primary'>
<em>Declared on line 61.</em>
</td>
  </tr>
</tbody>
</table>

helper function for adding a markdown paragraph


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