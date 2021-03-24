<!DOCTYPE html>
<!--Stores the error message and access the value to test-->
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
  <title>Class Use</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.Use</mark></h1>

**Author**: *Wai-Kin Chau*

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classUse([Current Class: cs.Use])
    classUse --> classUseCombo
    classUseCombo[cs.UseCombo]
    classUse --> classUseField
    classUseField[cs.UseField]
    classUseField --> classUsePhoneField
    classUsePhoneField[cs.UsePhoneField]
    classUse --> classUseValue
    classUseValue[cs.UseValue]

</pre>

Stores the error message and access the value to test

<h2>Method list</h2>

<table class='table table-hover'>
  <thead>
  <tr>  <td>Method Name</th>
  <td>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-success'><a href='#class-constructor'><strong>Class constructor($name : Text)<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getValue'>getValue()</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#setError'>setError()</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#setWarning'>setWarning()</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#setPass'>setPass()</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getText'>getText() -> $message : Text</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#hasError'>hasError() -> $answer : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#canIgnore'>canIgnore() -> $answer : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#isPassed'>isPassed() -> $answer : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#hasIssues'>hasIssues() -> $answer : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='class-constructor'><strong>Class Constructor</strong></h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$name (parameter 1)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'><em>Declared on line 3.</n></td>
  </tr>
</tbody>
</table>


















<h3 id='getValue'>getValue</h3>









<h3 id='setError'>setError</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-info'>$message</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 14.</n></td>
  </tr>
</tbody>
</table>


















<h3 id='setWarning'>setWarning</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-info'>$message</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 22.</n></td>
  </tr>
</tbody>
</table>


















<h3 id='setPass'>setPass</h3>












<h3 id='getText'>getText</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$message (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'><em>Declared on line 32.</n></td>
  </tr>
</tbody>
</table>






<h3 id='hasError'>hasError</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$answer (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'><em>Declared on line 34.</n></td>
  </tr>
</tbody>
</table>






<h3 id='canIgnore'>canIgnore</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$answer (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'><em>Declared on line 36.</n></td>
  </tr>
</tbody>
</table>






<h3 id='isPassed'>isPassed</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$answer (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'><em>Declared on line 38.</n></td>
  </tr>
</tbody>
</table>






<h3 id='hasIssues'>hasIssues</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$answer (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'><em>Declared on line 40.</n></td>
  </tr>
</tbody>
</table>






</div>
  <script>
    document.getElementById('content').innerHTML =
    marked(document.getElementById('content').innerHTML);
    mermaid.initialize({startOnLoad:true});  </script>
</body>
