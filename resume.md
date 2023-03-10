# Resume

*Alternatively, you can view the resume externally in 
[english](https://docs.google.com/viewer?url=https://github.com/linuswolff/linuswolff.github.io/raw/4a16072291e331a456d97f3b9493315a3fabf8ee/resume_test.pdf) or 
[german](https://docs.google.com/viewer?url=https://github.com/linuswolff/linuswolff.github.io/raw/4a16072291e331a456d97f3b9493315a3fabf8ee/resume_test.pdf).*

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
