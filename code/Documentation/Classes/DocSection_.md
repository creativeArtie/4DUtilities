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
    crossorigin='anonymous'
  >
  <script 
    src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js'
    integrity='sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0'
    crossorigin='anonymous'
  ></script>
  <title>Class DocSection_</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

<h1>Class <mark>cs.DocSection_</mark> <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
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
    <td class='table-success'><a href='#class-constructor'><strong>Class constructor()<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span></a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-danger'><a href='#setPrivate_'><em>setPrivate_()</em> <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
</a></td>
    <td class='table-danger'>check if the name ends with "_" meaning private</td>
  </tr>
  <tr>
    <td class='table-success'><a href='#paraseCommonTags'>paraseCommonTags($comment : cs.DocLine_)</a></td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'><a href='#getTypeBadge'>getTypeBadge() -> $badge : Text</a></td>
    <td class='table-success'></td>
  </tr>
</tbody>
</table>

<h2>Methods</h2>

<h3 id='class-constructor'><strong>Class Constructor</strong></h3>





















<h3 id='setPrivate_'>setPrivate_ <span class='badge bg-danger' data-bs-toggle='tooltip' title='To be use internally in a namespace' >private</span>
</h3>

check if the name ends with "_" meaning private













<h3 id='paraseCommonTags'>paraseCommonTags</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-primary'>$comment (parameter 1)</td>
    <td class='table-primary'>cs.DocLine_</td>
    <td class='table-primary'><em>Declared on line 14.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$pos</td>
    <td class='table-info'>Integer</td>
    <td class='table-info'><em>Declared on line 35.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$len</td>
    <td class='table-info'>Integer</td>
    <td class='table-info'><em>Declared on line 36.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$raw</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 39.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$value</td>
    <td class='table-info'>cs.DocValue_</td>
    <td class='table-info'><em>Declared on line 44.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$start</td>
    <td class='table-info'>LONGINT</td>
    <td class='table-info'> Start and end of the match<br /><em>Declared on line 52.</n></td>
  </tr>
  <tr>
    <td class='table-info'> $end) </td>
    <td class='table-info'>LONGINT</td>
    <td class='table-info'> Start and end of the match<br /><em>Declared on line 52.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$match) </td>
    <td class='table-info'>BOOLEAN</td>
    <td class='table-info'> use to make Match regex happy<br /><em>Declared on line 53.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$split</td>
    <td class='table-info'>Collection</td>
    <td class='table-info'><em>Declared on line 56.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$type</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 58.</n></td>
  </tr>
  <tr>
    <td class='table-info'>$name</td>
    <td class='table-info'>Text</td>
    <td class='table-info'><em>Declared on line 62.</n></td>
  </tr>
</tbody>
</table>

























































































































































<h3 id='getTypeBadge'>getTypeBadge</h3>

<table class='table '>
  <thead>
  <tr>  <td>Name</th>
  <td>Type</th>
  <td>Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-secondary'>$badge (return value)</td>
    <td class='table-secondary'>Text</td>
    <td class='table-secondary'><em>Declared on line 75.</n></td>
  </tr>
</tbody>
</table>







































</div>
    <script>
      document.getElementById('content').innerHTML =
      marked(document.getElementById('content').innerHTML);
</script>
</body>
