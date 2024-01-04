<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hepl | BRPL Online Orders</title>
    <link rel="stylesheet" href="../Online-Orders/css/bootstrap.min.css">
    <script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
</head>
<style>
h1{
  font-weight: 800 !important;
  font-size: 50px;
}

h6{
  color: #716f6f
}

.img-wrapper{
  width: 500px;
}

img{
  height: 100%;
  width: 100%;
}

input, textarea, select{
  background: #f7f9f8 !important;
}

.email-us{
  text-decoration: underline;
}

label{
  font-weight: 600;
  color: #716f6f
}

button{
  float: right;
}
button span{
  margin-left: 8px;  
}

button i{
  margin: 0px 8px;
}
</style>
<body>
    <jsp:include page="../home/NavigationBar.jsp" />
    <div class="container">
        <div class="row mt-4">
        <div class="col-md-6">
          <h1>Let's get you</br> some help!</h1>
          <h6>Have any issue? Send us a <span class="email-us">Query.</span></h6>
          <div class="img-wrapper">
          <img src="../Online-Orders/images/help.jpg" alt="Help images" border="0">
            </div>
        </div>
        
        <div class="col-md-6">
          <form method="post" action="/Online-Orders/post-help" id="help">
        <div class="form-group">
          <label for="list">What are you looking for?</label>
          <input type="text" class="form-control" id="list" aria-describedby="emailHelp" name="firstQuery">
        </div>
            
          <div class="form-group mt-4">
          <label for="describe">Please desribe your Query?</label>
          <textarea type="text" class="form-control" id="describe" rows="5" name="secondQuery"></textarea>
        </div>
                  
      <input type="submit" class="btn btn-primary mt-4" value = "send query" data-eve-reg="click,submit">
      </form>
        </div>
          
        </div>
      </div>
      <script src="../Online-Orders/javascript/help.js" type="module"></script>
</body>
</html>