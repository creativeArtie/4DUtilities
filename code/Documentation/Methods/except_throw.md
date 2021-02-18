<!DOCTYPE html>
<!-- Type your summary here -->
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
<script>mermaid.initialize({startOnLoad:true});</script>

<title>Page Title</title>
</head>
<body>

## Description

## Example

<code>
Type your example here
</code>

Here is one mermaid diagram:
```
<div class="mermaid">
    graph TD
    A[Client] --> B[Load Balancer]
    B --> C[Server1]
    B --> D[Server2]
</div>
```
And here is another:

```
<div class="mermaid">
  graph TD
  A[Client] -->|tcp_123| B(Load Balancer)
  B -->|tcp_456| C[Server1]
  B -->|tcp_456| D[Server2]
</div>
```

</body>
</html> 