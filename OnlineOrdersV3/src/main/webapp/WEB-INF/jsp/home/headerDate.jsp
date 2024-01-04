<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<script>
		$(function() {
			$("#includedContent").load("../Online-Orders/template/IncludeTime.html");
			$("#includedImage").load("../HeaderImage.html");
		});
	</script>
	<center><div id="includedContent" style="font-family: initial; background-color:#fff;"></div></center>
</body>
</html>