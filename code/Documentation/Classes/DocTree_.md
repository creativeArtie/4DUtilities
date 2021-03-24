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
  <title>Class DocTree_</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.DocTree_</mark> <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
</h1>

<h2>Description</h2>

<pre class='mermaid'>
graph TB
    classDocTree_([Current Class: cs.DocTree_])

</pre>



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
    <td class='table-success'><a href='#addClass'>addClass($class : cs.DocClass_; $root : cs.DocTree_) -> $filled : Boolean</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#printGraph'>printGraph($current : Text; $input : cs.DocMermaid_) -> $graph : Text</a></td>
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
    <td class='table-primary'><em>Declared on line 1.</n></td>
  </tr>
</tbody>
</table>












<h3 id='addClass'>addClass</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$class (parameter 1)</td>
    <td class='table-primary'>cs.DocClass_</td>
    <td class='table-primary'><em>Declared on line 5.</n></td>
  </tr>
  <tr>
    <td class='table-primary'>$root (parameter 2)</td>
    <td class='table-primary'>cs.DocTree_</td>
    <td class='table-primary'><em>Declared on line 5.</n></td>
  </tr>
  <tr>
    <td class='table-secondary'>$filled (return value)</td>
    <td class='table-secondary'>Boolean</td>
    <td class='table-secondary'><em>Declared on line 5.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$current</td>
    <td class='table-info'>cs.DocTree_</td>
    <td class='table-info'><em>Declared on line 6.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$filled</td>
    <td class='table-info'>BOOLEAN</td>
    <td class='table-info'><em>Declared on line 9.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$child</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 17.</n></td>
  </tr>
</tbody>
</table>






















































<h3 id='printGraph'>printGraph</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$current (parameter 1)</td>
    <td class='table-primary'>Text</td>
    <td class='table-primary'><em>Declared on line 26.</n></td>
  </tr>
  <tr>
    <td class='table-primary'>$input (parameter 2)</td>
    <td class='table-primary'>cs.DocMermaid_</td>
    <td class='table-primary'><em>Declared on line 26.</n></td>
  </tr>
  <tr>
    <td class='table-secondary'>$graph (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'><em>Declared on line 26.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$name</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 30.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$spaces</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 36.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$name</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 44.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$child</td>
    <td class='table-info'>cs.DocTree_</td>
    <td class='table-info'><em>Declared on line 45.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$temp</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 49.</n></td>
  </tr>
</tbody>
</table>








































































</div>
  <script>
    document.getElementById('content').innerHTML =
    marked(document.getElementById('content').innerHTML);
    mermaid.initialize({startOnLoad:true});  </script>
</body>