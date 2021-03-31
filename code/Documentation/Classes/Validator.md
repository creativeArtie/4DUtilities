<!DOCTYPE html>
<!--manager for the validations-->
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
  <title>Class Validator</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.Validator</mark></h1>

**Author**: *Wai-Kin Chau*

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classValidator([Current Class: cs.Validator])

</pre>

manager for the validations

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
    <td class='table-success'>
<a href='#addMandatory'>addMandatory()</a>
</td>
    <td class='table-success'>
adds fields that need to be valid
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#addOptional'>addOptional()</a>
</td>
    <td class='table-success'>
adds fields that can be valid
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#runChecks'>runChecks()</a>
</td>
    <td class='table-success'>
runs the check
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#hasErrors'>hasErrors() -> $answer : Boolean</a>
</td>
    <td class='table-success'>
check if there are errors
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#hasWarnings'>hasWarnings() -> $answer : Boolean</a>
</td>
    <td class='table-success'>
check if there are warnings
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#hasNoIssues'>hasNoIssues() -> $answer : Boolean</a>
</td>
    <td class='table-success'>
check if there are no issues
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#canIgnore'>canIgnore() -> $answer : Boolean</a>
</td>
    <td class='table-success'>
check if the remaining issues can be ignored
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#getErrorCount'>getErrorCount() -> $answer : Integer</a>
</td>
    <td class='table-success'>
count the number of errors
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#getWarningCount'>getWarningCount() -> $answer : Integer</a>
</td>
    <td class='table-success'>
count the number of warning
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#getTotal'>getTotal() -> $answer : Integer</a>
</td>
    <td class='table-success'>
count the number of issues
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#listErrors'>listErrors() -> $answer : Collection</a>
</td>
    <td class='table-success'>
list the errors
</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#listWarnings'>listWarnings() -> $answer : Collection</a>
</td>
    <td class='table-success'>
list the warnings
</td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='class-constructor'><strong>Class Constructor</strong></h3>



<h3 id='addMandatory'>addMandatory</h3>

adds fields that need to be valid

<h3 id='addOptional'>addOptional</h3>

adds fields that can be valid

<h3 id='runChecks'>runChecks</h3>

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
$result
</td>
    <td class='table-info'>
Boolean
</td>
    <td class='table-info'>
<em>Declared on line 48.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$ptr
</td>
    <td class='table-info'>
cs.Check
</td>
    <td class='table-info'>
<em>Declared on line 49.</em>
</td>
  </tr>
  <tr>
    <td class='table-info'>
$value
</td>
    <td class='table-info'>
cs.Use
</td>
    <td class='table-info'>
<em>Declared on line 50.</em>
</td>
  </tr>
</tbody>
</table>

runs the check

<h3 id='hasErrors'>hasErrors</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Boolean
</td>
    <td class='table-secondary'>
<em>Declared on line 74.</em>
</td>
  </tr>
</tbody>
</table>

check if there are errors

<h3 id='hasWarnings'>hasWarnings</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Boolean
</td>
    <td class='table-secondary'>
<em>Declared on line 78.</em>
</td>
  </tr>
</tbody>
</table>

check if there are warnings

<h3 id='hasNoIssues'>hasNoIssues</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Boolean
</td>
    <td class='table-secondary'>
<em>Declared on line 82.</em>
</td>
  </tr>
</tbody>
</table>

check if there are no issues

<h3 id='canIgnore'>canIgnore</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Boolean
</td>
    <td class='table-secondary'>
<em>Declared on line 86.</em>
</td>
  </tr>
</tbody>
</table>

check if the remaining issues can be ignored

<h3 id='getErrorCount'>getErrorCount</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Integer
</td>
    <td class='table-secondary'>
<em>Declared on line 90.</em>
</td>
  </tr>
</tbody>
</table>

count the number of errors

<h3 id='getWarningCount'>getWarningCount</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Integer
</td>
    <td class='table-secondary'>
<em>Declared on line 94.</em>
</td>
  </tr>
</tbody>
</table>

count the number of warning

<h3 id='getTotal'>getTotal</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Integer
</td>
    <td class='table-secondary'>
<em>Declared on line 98.</em>
</td>
  </tr>
</tbody>
</table>

count the number of issues

<h3 id='listErrors'>listErrors</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Collection
</td>
    <td class='table-secondary'>
<em>Declared on line 102.</em>
</td>
  </tr>
</tbody>
</table>

list the errors

<h3 id='listWarnings'>listWarnings</h3>

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
$answer (return value)
</td>
    <td class='table-secondary'>
Collection
</td>
    <td class='table-secondary'>
<em>Declared on line 106.</em>
</td>
  </tr>
</tbody>
</table>

list the warnings


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