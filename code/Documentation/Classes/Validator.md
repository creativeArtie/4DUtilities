<!DOCTYPE html>
<!--manager for the validations-->
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
  <title>Class Validator</title>
  <meta charset='ASCII' />
  <meta name='generator' value='4D Documentation' />
</header>
<body>
<div id='content' class='container'>

# Class <mark>cs.Validator</mark>

**Author**: *Wai-Kin Chau*

## Description

manager for the validations

 It have two type of tests, mandatory and optional.


 Optional fields does not need to be valid, while required fields does


## Method list

<table class='table table-hover'>
  <thead>
  <tr>  <th class='table-primary'>Method Name</th>
  <th class='table-primary'>Method Brief</th>
  </tr></thead>
  <tbody>
  <tr>
    <td class='table-success'><strong>Class constructor<strong> <span class='badge bg-primary' data-bs-toggle='tooltip' title='Class Constructor' >constructor</span>
</td>
    <td class='table-success'></td>
  </tr>
  <tr>
    <td class='table-success'>addMandatory</td>
    <td class='table-success'>adds fields that need to be valid</td>
  </tr>
  <tr>
    <td class='table-success'>addOptional</td>
    <td class='table-success'>adds fields that can be valid</td>
  </tr>
  <tr>
    <td class='table-success'>runChecks</td>
    <td class='table-success'>runs the check</td>
  </tr>
  <tr>
    <td class='table-success'>hasErrors</td>
    <td class='table-success'>check if there are errors</td>
  </tr>
  <tr>
    <td class='table-success'>hasWarnings</td>
    <td class='table-success'>check if there are warnings</td>
  </tr>
  <tr>
    <td class='table-success'>hasNoIssues</td>
    <td class='table-success'>check if there are no issues</td>
  </tr>
  <tr>
    <td class='table-success'>canIgnore</td>
    <td class='table-success'>check if the remaining issues can be ignored</td>
  </tr>
  <tr>
    <td class='table-success'>getErrorCount</td>
    <td class='table-success'>count the number of errors</td>
  </tr>
  <tr>
    <td class='table-success'>getWarningCount</td>
    <td class='table-success'>count the number of warning</td>
  </tr>
  <tr>
    <td class='table-success'>getTotal</td>
    <td class='table-success'>count the number of issues</td>
  </tr>
  <tr>
    <td class='table-success'>listErrors</td>
    <td class='table-success'>list the errors</td>
  </tr>
  <tr>
    <td class='table-success'>listWarnings</td>
    <td class='table-success'>list the warnings</td>
  </tr>
</tbody>
</table>

</div>
    <script>
      document.getElementById('content').innerHTML =
      marked(document.getElementById('content').innerHTML);
</script>
</body>
