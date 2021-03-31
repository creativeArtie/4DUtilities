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
  <title>Class UseCombo</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.UseCombo</mark></h1>

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classUse[cs.Use]
    classUse --> classUseCombo
    classUseCombo([Current Class: cs.UseCombo])
    classUse --> classUseField
    classUseField[cs.UseField]
    classUseField --> classUsePhoneField
    classUsePhoneField[cs.UsePhoneField]
    classUse --> classUseValue
    classUseValue[cs.UseValue]

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
<a href='#class-constructor'><strong>Class constructor()<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#getValue'>getValue() -> $value : Variant</a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#setError'>setError()</a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#setWarning'>setWarning()</a>
</td>
    <td class='table-success'>

</td>
  </tr>
  <tr>
    <td class='table-success'>
<a href='#setPass'>setPass()</a>
</td>
    <td class='table-success'>

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
    <td class='table-info'>
$pointer
</td>
    <td class='table-info'>
POINTER
</td>
    <td class='table-info'>
<em>Declared on line 6.</em>
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
<em>Declared on line 8.</em>
</td>
  </tr>
</tbody>
</table>



<div class='alert alert-warning'>
<h4 class='alert-heading'>TODO</h4>

check if `$pointer` is an widget
</div>


<h3 id='getValue'>getValue</h3>

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
$value (return value)
</td>
    <td class='table-secondary'>
Variant
</td>
    <td class='table-secondary'>
<em>Declared on line 16.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='setError'>setError</h3>

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
$count
</td>
    <td class='table-info'>
Real
</td>
    <td class='table-info'>
<em>Declared on line 21.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='setWarning'>setWarning</h3>

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
$count
</td>
    <td class='table-info'>
Real
</td>
    <td class='table-info'>
<em>Declared on line 30.</em>
</td>
  </tr>
</tbody>
</table>



<h3 id='setPass'>setPass</h3>




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