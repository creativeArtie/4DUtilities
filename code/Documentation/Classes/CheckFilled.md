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
  <title>Class CheckFilled</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.CheckFilled</mark></h1>

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classCheck[cs.Check]
    classCheck --> classCheckAge
    classCheckAge[cs.CheckAge]
    classCheck --> classCheckFilled
    classCheckFilled([Current Class: cs.CheckFilled])
    classCheck --> classCheckFormat
    classCheckFormat[cs.CheckFormat]
    classCheck --> classCheckNot
    classCheckNot[cs.CheckNot]
    classCheck --> classCheckTrue
    classCheckTrue[cs.CheckTrue]
    classCheck --> classCheckValue
    classCheckValue[cs.CheckValue]
    classCheck --> classCheckWhen
    classCheckWhen[cs.CheckWhen]

</pre>



<h2>Method list</h2>

<table class='table table-hover'>
  <thead>
  <tr>  <td>Method Name</th>
  <td>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-success'><a href='#test'>test() -> $result : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getMessageTemplate'>getMessageTemplate() -> $template : Text</a></td>
    <td class='table-success'></td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='test'>test</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$result (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'><em>Declared on line 2.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$value</td>
    <td class='table-info'>Variant</td>
    <td class='table-info'><em>Declared on line 3.</n></td>
  </tr>
</tbody>
</table>







































<h3 id='getMessageTemplate'>getMessageTemplate</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$template (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'><em>Declared on line 16.</n></td>
  </tr>
</tbody>
</table>






</div>
  <script>
    document.getElementById('content').innerHTML =
    marked(document.getElementById('content').innerHTML);
    mermaid.initialize({startOnLoad:true});  </script>
</body>
