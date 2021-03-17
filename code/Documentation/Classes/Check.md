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
    crossorigin='anonymous'>
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

# Class <mark>cs.Check</mark>

**Author**: *Wai-Kin Chau*

## Description

Runs the test and gets the template message

## Method list

<table class='table table-hover'>
  <thead>
  <tr>  <th class='table-primary'>Method Name</th>
  <th class='table-primary'>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-warning'><em>test</em> <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</td>
    <td class='table-warning'>Test the values</td>
  </tr>
  <tr>
    <td class='table-warning'><em>getMessageTemplate</em> <span class='badge bg-warning' data-bs-toggle='tooltip' title='Needs implementation in subclass' >abstract</span>
</td>
    <td class='table-warning'>Gets the template message</td>
  </tr>
  <tr>
    <td class='table-success'>setValue</td>
    <td class='table-success'>Set the checking value</td>
  </tr>
  <tr>
    <td class='table-success'>getValue</td>
    <td class='table-success'>Gets the checking value</td>
  </tr>
</tbody>
</table>

</div>
    <script>
      document.getElementById('content').innerHTML =
      marked(document.getElementById('content').innerHTML);
</script>
</body>
