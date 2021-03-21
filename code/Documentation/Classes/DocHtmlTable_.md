<!DOCTYPE html>
<!---->
<html>
<header>
  <script src='https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/marked/marked.min.js'></script>
  <script>mermaid.initialize({startOnLoad:true});</script>
  <link 
    href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css'
    rel='stylesheet'
    integrity='sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl'
    crossorigin='anonymous'>
  <script 
    src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js'
    integrity='sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0'
    crossorigin='anonymous'
  ></script>
  <title>Class DocHtmlTable_</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.DocHtmlTable_</mark> <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
</h1>

<h2>Description</h2>



<h2>Method list</h2>

<table class='table table-hover'>
  <thead>
  <tr>  <td>Method Name</th>
  <td>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-success'><a href='#class-constructor'><strong>Class constructor($classes : Text)<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#addHeader'>addHeader($header : Text)</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#addData'>addData($class : Text; $data : Collection)</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#hasData'>hasData() -> $isFilled : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getHTMLtable'>getHTMLtable() -> $doc : Text</a></td>
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
    <td class='table-primary'>$classes (parameter 1)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'></td>
  </tr>
</tbody>
</table>















<h3 id='addHeader'>addHeader</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$header (parameter 1)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'></td>
  </tr>
</tbody>
</table>









<h3 id='addData'>addData</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$class (parameter 1)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'></td>
  </tr>
  <tr>
    <td class='table-primary'>$data (parameter 2)</td>
    <td class='table-primary'>Collection</td>
    <td class='table-primary'></td>
  </tr>
</tbody>
</table>









<h3 id='hasData'>hasData</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$isFilled (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'></td>
  </tr>
</tbody>
</table>









<h3 id='getHTMLtable'>getHTMLtable</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$doc (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'></td>
  </tr>
  <tr>
    <td class='table-info'>$headers</td>
    <td class='table-info'>Text</td>
    <td class='table-info'></td>
  </tr>
  <tr>
    <td class='table-info'>$cell</td>
    <td class='table-info'>Text</td>
    <td class='table-info'></td>
  </tr>
  <tr>
    <td class='table-info'>$content</td>
    <td class='table-info'>Text</td>
    <td class='table-info'></td>
  </tr>
  <tr>
    <td class='table-info'>$row</td>
    <td class='table-info'>Object</td>
    <td class='table-info'></td>
  </tr>
</tbody>
</table>

























































</div>
    <script>
      document.getElementById('content').innerHTML =
      marked(document.getElementById('content').innerHTML);
</script>
</body>
