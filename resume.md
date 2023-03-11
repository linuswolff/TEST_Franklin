# Resume

*Alternatively, you can view the resume externally in 
[english](/resume_test.pdf) or 
[german](/resume_test.pdf).*

~~~
<head>
	<script>
		function switchVersion() {
			var pdfObject = document.getElementById("pdfObject");
			if (pdfObject.data == "/resume_test.pdf") {
				pdfObject.data = "/resume_test.pdf";
			} else {
				pdfObject.data = "/resume_test.pdf";
			}
		}
	</script>
</head>
<body>
    <button onclick="switchVersion()">english / german</button>
    <br></br>
	<object id="pdfObject" data="/resume_test.pdf" type="application/pdf" width="550px" height="800px">
	</object>
</body>
~~~