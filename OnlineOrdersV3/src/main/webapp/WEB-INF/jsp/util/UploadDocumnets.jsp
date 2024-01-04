<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Brpl | upload file</title>
<link
	href="https://releases.transloadit.com/uppy/v3.3.1/uppy.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../home/NavigationBar.jsp" />
	<div class="container">
		<div class="d-flex justify-content-around row">
			<c:choose>
   				<c:when test="${check[0] != null}">
					<div class="col-5 mt-3">
						<img src="${check[0].path}" alt="" width="100%"  height="100%">
					</div>
   				</c:when>
    			<c:otherwise>
					<div class="col-5 mt-3">
						<h5 class="m-3 text-center">Upload Pan-card</h5>
						<div id="drag-drop-area1"></div>
					</div>
   				 </c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${check[1] != null}">
				 <div class="col-5 mt-3">
					<img src="${check[1].path}" alt="" width="100%"  height="100%">
				 </div>
				</c:when>
			 <c:otherwise>
				<div class="col-5 mt-3">
					<h5 class="m-3 text-center">Upload GstNumber</h5>
					<div id="drag-drop-area2"></div>
				</div>
				 </c:otherwise>
		 </c:choose>
		</div>
	</div>
	<jsp:include page="../home/footer.jsp" />
	<script type="module">
      import {Uppy, Dashboard, XHRUpload} from "https://releases.transloadit.com/uppy/v3.3.1/uppy.min.mjs"
		
      if(document.getElementById("drag-drop-area1")) {
		      var uppy1 = new Uppy({
			  restrictions: {
				 maxFileSize: 3000000,
    			 maxNumberOfFiles: 1,
                 minNumberOfFiles: 1,
                 allowedFileTypes: ['image/jpeg','image/jpg','image/png'],
                
  				},

		})
        .use(Dashboard, {
          note: 'Images and video only, 3 MB or less',
          inline: true,
          target: '#drag-drop-area1',
		   width: 500,
  		   height: 400,
           
        })
        .use(XHRUpload, {
		endpoint: './process-documents',
		fieldName: "panNumber",
		formData: true,
		})

      uppy1.on('complete', (result) => {
        console.log('Upload complete! We’ve uploaded these files:', result.successful)
      })
	}	

	   if(document.getElementById("drag-drop-area2")) {
      var uppy2 = new Uppy({
			  restrictions: {
 				 maxFileSize: 3000000,
    			 maxNumberOfFiles: 1,
                 minNumberOfFiles: 1,
                 allowedFileTypes: ['image/jpeg','image/jpg','image/png']
  				},
		}) 
        .use(Dashboard, {
          note: 'Images and video only, 3mb or less',
          inline: true,
          target: '#drag-drop-area2',
		  width: 500,
  		  height: 400,
        })
		.use(XHRUpload, {
		endpoint: './process-documents',
		fieldName: "gstNumber",
		formData: true,
		})

      uppy2.on('complete', (result) => {
        console.log('Upload complete! We’ve uploaded these files:', result.successful)
      })
}
    </script>
</body>
</html>