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
  <title>Class UsePhoneField</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.UsePhoneField</mark></h1>

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classUse[cs.Use]
    classUse --> classUseCombo
    classUseCombo[cs.UseCombo]
    classUse --> classUseField
    classUseField[cs.UseField]
    classUseField --> classUsePhoneField
    classUsePhoneField([Current Class: cs.UsePhoneField])
    classUse --> classUseValue
    classUseValue[cs.UseValue]

</pre>



<h2>Method list</h2>

<table class='table table-hover'>
  <thead>
  <tr>  <td>Method Name</th>
  <td>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-success'><a href='#class-constructor'><strong>Class constructor($name : Text; $countryCode : Text)<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getValue'>getValue() -> $value : Object</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#extractDigits'>extractDigits() -> $answer : Text</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#handleEvents'>handleEvents()</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#formatPhone'>formatPhone($token : Text) -> $answer : Text</a></td>
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
    <td class='table-primary'><em>Declared on line 2.</n></td>
  </tr>
  <tr>
    <td class='table-primary'>$countryCode (parameter 2)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'><em>Declared on line 2.</n></td>
  </tr>
</tbody>
</table>





















<h3 id='getValue'>getValue</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$value (return value)</td>
    <td class='table-secondary'>Object</td>
    <td class='table-secondary'><em>Declared on line 9.</n></td>
  </tr>
</tbody>
</table>









<h3 id='extractDigits'>extractDigits</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$answer (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'><em>Declared on line 12.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$input</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 13.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$elmt</td>
    <td class='table-info'>Integer</td>
    <td class='table-info'><em>Declared on line 17.</n></td>
  </tr>
</tbody>
</table>






























<h3 id='handleEvents'>handleEvents</h3>



























<h3 id='formatPhone'>formatPhone</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$token (parameter 1)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'><em>Declared on line 33.</n></td>
  </tr>
  <tr>
    <td class='table-secondary'>$answer (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'><em>Declared on line 33.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$search</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 35.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$copy</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 67.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$trying</td>
    <td class='table-info'>Boolean</td>
    <td class='table-info'><em>Declared on line 71.</n></td>
  </tr>
</tbody>
</table>



























































































































































































































</div>
  <script>
    document.getElementById('content').innerHTML =
    marked(document.getElementById('content').innerHTML);
    mermaid.initialize({startOnLoad:true});  </script>
</body>
