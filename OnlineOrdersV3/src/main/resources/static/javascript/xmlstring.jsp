<!DOCTYPE html>
<html>
<head>
  <script src="jquery.js"></script>
</head>
<body>
  
<p id="someElement">Code replace here</p>
<p id="anotherElement"></p>

<%
	String xml = "<rss version='2.0'><channel><title>RSS Title</title></channel></rss>";
%>  

<script>
	var xml= "<%= xml%>";
   // var xml = "<rss version='2.0'><channel><title>RSS Title</title></channel></rss>";
    xmlDoc = $.parseXML( xml );
    $xml = $( xmlDoc );
    $title = $xml.find( "title" );

/* append "RSS Title" to #someElement */
$( "#someElement" ).append( $title.text() );

/* change the title to "XML Title" */
$title.text( "XML Title" );

/* append "XML Title" to #anotherElement */
$( "#anotherElement" ).append( $title.text() );
</script>

</body>
</html>