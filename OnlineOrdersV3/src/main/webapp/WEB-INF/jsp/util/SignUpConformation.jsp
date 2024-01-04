<!DOCTYPE html>
 <html lang="en">
 <head>
	 <meta charset="UTF-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <title>Document</title>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <style>
a {
  text-decoration:none;
}

.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}



.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
   visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
}


.popup .content {
  max-height: 30%;
  overflow: auto;
}

.popup--msg {
  padding:1rem;
  text-align:center;
}

.popup--msg h4 {
font-size:1.2rem;
margin:.2rem;
}

.popup--msg p {
font-size:1rem;
 text-align:center;
}

.popup--btn {
  display:flex;
  justify-content:center;
  align-items:center;
}

.popup--btn  a {
  border:1px solid #ec8d1b;
  padding:.5rem;
  margin:.5rem;
  border-radius:12%;
  color:black;
}

#popup--btn__one {
  background-color:#ec8d1b;
  color:white;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}
 </style>
 </head>
 <body>


<div id="popup1" class="overlay">
  <div class="popup">

    <div class="content">
      <div class="popup--msg">
        <h4>Registraion Succesfully</h4>
        <p>Registraion Succesfully, Now You Can Login.</p>
      </div>
      <div class="popup--btn">
        <a href="HomeCheck.jsp" id = "popup--btn__one">HomePage</a>
        <a href="../Login/logout.jsp">Login</a>
      </div>
    </div>
  </div>
</div>
 </body>
 </html>