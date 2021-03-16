<!DOCTYPE html>
<!-- Except catch -->
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>mermaid.initialize({startOnLoad:true});</script>

<title>Page Title</title>
</head>
<body>

<div id="content">

## Example

~~~
Type your example here
~~~

1. Test 1
2. Test 2
</div>

Here is one mermaid diagram:

<pre class="mermaid">
    graph TD
    A[Client] --> B[Load Balancer]
    B --> C[Server1]
    B --> D[Server2]
</pre>
And here is another:

```
<div class="mermaid">
  graph TD
  A[Client] -->|tcp_123| B(Load Balancer)
  B -->|tcp_456| C[Server1]
  B -->|tcp_456| D[Server2]
</div>
```

<script>
document.getElementById('content').innerHTML =
  marked(document.getElementById('content').innerHTML);
</script>
</body>
</html> 