<!DOCTYPE html>
<!--Runs the test and gets the template message-->
<html>
<header>
  <script src='https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/marked/marked.min.js'></script>
  <script>mermaid.initialize({startOnLoad:true});</script>
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
  <title>Class Check</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.Check</mark></h1>

**Author**: *Wai-Kin Chau*

<h2>Description</h2>

Runs the test and gets the template message

<h2>Method list</h2>

<table class='table table-hover'>
  <thead>
  <tr>  <td>Method Name</th>
  <td>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-warning'><a href='#test'><em>test()</em> <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</a></td>
    <td class='table-warning'>Test the values</td>
  </tr>
  <tr>
    <td class='table-warning'><a href='#getMessageTemplate'><em>getMessageTemplate() -> $template : Text</em> <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</a></td>
    <td class='table-warning'>Gets the template message</td>
  </tr>
  <tr>
    <td class='table-success'><a href='#setValue'>setValue($value : Variant)</a></td>
    <td class='table-success'>Set the checking value</td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getValue'>getValue() -> $result : Variant</a></td>
    <td class='table-success'>Gets the checking value</td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='test'>test <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</h3>

Test the values

 By the time this method is called, 		`This.setValue()` will be called in cs.Validator


<h3 id='getMessageTemplate'>getMessageTemplate <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</h3>

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
    <td class='table-secondary'><em>Declared on line 7.</n></td>
  </tr>
</tbody>
</table>

Gets the template message

<h3 id='setValue'>setValue</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$value (parameter 1)</td>
    <td class='table-primary'>Variant</td>
    <td class='table-primary'><em>Declared on line 10.</n></td>
  </tr>
</tbody>
</table>

Set the checking value






















<h3 id='getValue'>getValue</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$result (return value)</td>
    <td class='table-secondary'>Variant</td>
    <td class='table-secondary'><em>Declared on line 20.</n></td>
  </tr>
</tbody>
</table>

Gets the checking value




</div>
    <script>
      document.getElementById('content').innerHTML =
      marked(document.getElementById('content').innerHTML);
</script>
</body>
