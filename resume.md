# Resume

*Alternatively, you can view the resume externally in 
[english](/resume_english.pdf) or 
[german](/resume_german.pdf).*

~~~
<head>
	<script>
		function switchVersion() {
			var pdfObject = document.getElementById("pdfObject");
			if (pdfObject.data == "/resume_english.pdf") {
				pdfObject.data = "/resume_german.pdf";
			} else {
				pdfObject.data = "/resume_english.pdf";
			}
		}
	</script>
</head>
<body>
    <button class="resume" onclick="switchVersion()">english / german</button>
    <br></br>
	<object id="pdfObject" data="/resume_english.pdf" type="application/pdf" width="750px" height="1061px">
	</object>
</body>
~~~