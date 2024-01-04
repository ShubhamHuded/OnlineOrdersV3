<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #fff;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
	border: 1px solid #000;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 15px;
	color: black;
	display: block;
	transition: 0.2s;
}

.sidenav a:hover, .offcanvas a:focus {
	color: orangered;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
	background-color: #fff !important;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

#second--ham {
	display: none;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}



.nav--bar {
	width: 100%;
	background-color: #ce7f20;
	height: 50px;
	display: flex;
	justify-content: center;
	position: relative;
}

.nav--bar_base {
	width: 90%;
	max-width: 1000px;
	display: flex;
}

.nav--head {
	width: 30%;
	font-size: 1rem !important;
}

.nav--items_cover {
	width: 70%;
}

.nav--list {
	display: flex;
	justify-content: end;
	padding: 0 .8rem 0 .8rem;
	height: 40px;
}

.global--nav__items {
	display: flex;
	align-items: center;
	margin: 0 1.2rem 0 .2rem;
}

.drop--down__col {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #fff;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	/* justify-content: center; */
	position: absolute;
	left: -80%;
	top: 110%;
	min-width: 200px;
	border-radius: 8px;
	border-top: 1px solid #d8cece;
}

.show {
	display: block;
}

#notif--service:hover {
	animation: ring 0.7s ease-in-out;
	transform-origin: 50% 2px;
}

.nav--acc__edit {
	padding: 0.8rem 0rem .8rem 0.5rem;
}

.nav--acc__edit ul {
	padding: 0.2rem 0rem .5rem 0.4rem;
}

.nav--acc__edit ul li {
	padding: 0;
	margin-bottom: .1rem;
	color: #473e3e;
}

.nav--acc__edit ul li a:active {
	background-color: yellow;
}

.edit--header {
	padding: 1rem;
}

.hamburger input[type="checkbox"] {
	width: 40px;
	height: 32px;
	position: absolute;
	top: 9px;
	left: 10px;
	display: block;
	z-index: 3;
	opacity: 0;
	cursor: pointer;
}

.hamburgerlines {
	width: 40px;
	height: 32px;
	position: absolute;
	top: 8px;
	left: 7px;
	z-index: 2;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.menu-items {
	padding-top: 1rem;
	/*  transform: translate(-2000%);  */
	transition: transform 0.1s ease-in-out;
	/* padding-left: 15px; */
	background: #000;
	margin-top: 20px;
	color: #fff;
	padding-bottom: 1rem;
	width: 200px;
	position: absolute;
	z-index: 5;
	display: flex;
	flex-direction: column;
	height: 100vh;
	opacity: 0;
}

.menu-items li {
	font-size: .89rem;
	color: white;
	margin-left: .2rem;
}

.menu-items li a {
	color: white;
}

.hamburger input[type="checkbox"]:checked ~ .menu-items {
	/*   transform: translate(0%); */
	top: 35px;
	left: 0;
	opacity: 0.8;
}

#ham--hideNav {
	display: none;
}

@keyframes ring {
     0% {
         transform: rotate(2deg);
    }
     35% {
         transform : rotate(30deg);
    }
     75% {
         transform : rotate(-30deg);
    }
     100% {
         transform : rotate(-2deg);
    }
}


@media only screen and (max-width: 650px) {
	.nav--items_cover {
		display:none;
	}
	
	#second--ham {
		display: block;
			  position: absolute;
			  top: 8px;
			  right: 16px;
			  font-size: 18px;
	}
	
	.nav--head {
	width: 30%;
	font-size: .8rem;

	}
		
	#ham--hideNav {
		
	}
}

</style>
</head>
<body>
  <%
  String message = (String) request.getAttribute("type");
	%>
  <div class="nav--bar">
    <div id="mySidenav" class="sidenav">
	  <div id = "ham--hideNav">
	   <a href="">Home</a>
       <a href="/Online-Orders/help">Help</a>
	  </div>
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
     	  <%
			if (message.equalsIgnoreCase("admin")) {
			%>
      <a href="/Online-Orders/subusers">SubUser list</a>
      <%
			}
	   %>
      <a href="/Online-Orders/create-company-profile">Company Profile</a>
      
      <% if (message.equalsIgnoreCase("admin")) {
      %>
       <a href="/Online-Orders/uploadDocuments">Documents</a> 
      <%
			}
	   %>
	   <a href="/Online-Orders/reports">Reports</a>
      <a href="/Online-Orders/terms-condition">Terms and Condition</a>
    </div>

    <div class="nav--bar_base">
      <div class="nav--head" style="margin-top:5px;">BRPL | Online Orders</div>
      <div class="nav--items_cover">
        <ul class="nav--list gap-2">
          <li class="global--nav__items"><a href="/Online-Orders/home" class="d-flex d-col">
              <div class="d-flex d-center">
                <svg width="18" height="21" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                  <path d="M575.8 255.5C575.8 273.5 560.8 287.6 543.8 287.6H511.8L512.5 447.7C512.5 450.5 512.3 453.1 512 455.8V472C512 494.1 494.1 512 472 512H456C454.9 512 453.8 511.1 452.7 511.9C451.3 511.1 449.9 512 448.5 512H392C369.9 512 352 494.1 352 472V384C352 366.3 337.7 352 320 352H256C238.3 352 224 366.3 224 384V472C224 494.1 206.1 512 184 512H128.1C126.6 512 125.1 511.9 123.6 511.8C122.4 511.9 121.2 512 120 512H104C81.91 512 64 494.1 64 472V360C64 359.1 64.03 358.1 64.09 357.2V287.6H32.05C14.02 287.6 0 273.5 0 255.5C0 246.5 3.004 238.5 10.01 231.5L266.4 8.016C273.4 1.002 281.4 0 288.4 0C295.4 0 303.4 2.004 309.5 7.014L564.8 231.5C572.8 238.5 576.9 246.5 575.8 255.5L575.8 255.5z" />
                </svg>
              </div> <span style="font-size: 13px;">Home</span>
            </a></li>
          <li class="global--nav__items"><a href="#" class="d-flex d-col">
              <div class="d-flex d-center" id="notif--service">

                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="21" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                </svg>
              </div> <span style="font-size: 13px;">Notification</span>
            </a></li>
          <li class="global--nav__items d-col drop--down__col" style="padding-top: 0px;">
			<a href="#" class="d-flex d-col dropbtn" id="drop--btn">
                <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48" viewBox="0 0 48 48" style="width: 20px; height: 20px;margin-left:10px;" class="align-center">
                  <path d="M11.1 35.25q3.15-2.2 6.25-3.375Q20.45 30.7 24 30.7q3.55 0 6.675 1.175t6.275 3.375q2.2-2.7 3.125-5.45Q41 27.05 41 24q0-7.25-4.875-12.125T24 7q-7.25 0-12.125 4.875T7 24q0 3.05.95 5.8t3.15 5.45ZM24 25.5q-2.9 0-4.875-1.975T17.15 18.65q0-2.9 1.975-4.875T24 11.8q2.9 0 4.875 1.975t1.975 4.875q0 2.9-1.975 4.875T24 25.5ZM24 44q-4.1 0-7.75-1.575-3.65-1.575-6.375-4.3-2.725-2.725-4.3-6.375Q4 28.1 4 24q0-4.15 1.575-7.775t4.3-6.35q2.725-2.725 6.375-4.3Q19.9 4 24 4q4.15 0 7.775 1.575t6.35 4.3q2.725 2.725 4.3 6.35Q44 19.85 44 24q0 4.1-1.575 7.75-1.575 3.65-4.3 6.375-2.725 2.725-6.35 4.3Q28.15 44 24 44Zm0-3q2.75 0 5.375-.8t5.175-2.8q-2.55-1.8-5.2-2.75-2.65-.95-5.35-.95-2.7 0-5.35.95-2.65.95-5.2 2.75 2.55 2 5.175 2.8Q21.25 41 24 41Zm0-18.5q1.7 0 2.775-1.075t1.075-2.775q0-1.7-1.075-2.775T24 14.8q-1.7 0-2.775 1.075T20.15 18.65q0 1.7 1.075 2.775T24 22.5Zm0-3.85Zm0 18.7Z" />
                </svg>
                <span class="dropbtn" style="font-size: 13px;">Profile
                  <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
				  </svg>
                </span>
            </a>
            <div id="myDropdown" class="dropdown-content">
              <div class="d-flex d-col">
                <div class="d-flex justify-content-start edit--header gap-3">
                  	<svg  xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ce7f20" class="bi bi-person-circle" viewBox="0 0 16 16">
 					 <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
                      <span>${name}</span> 
                </div>
                <hr style="width: 96%; text-align: left; margin-left: 2%; color: #000;">
                <div class="d-flex d-col" style="padding-left:10px;">
                  <h5>Account Setting</h5>
                  <ul class="d-flex  d-col list-unstyled">
                    <li><a href="/Online-Orders/edit-Profile">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#ce7f20" class="bi bi-person" viewBox="0 0 16 16">
  						<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
					</svg>View Profile</a>
					</li>
                    <li>
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#ce7f20" class="bi bi-key" viewBox="0 0 16 16">
  					<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
 					 <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
					</svg>
                    <a href="/Online-Orders/updatePassword">Change Password</a>
                    </li>
                  </ul> 
                </div>
                <div class="d-flex d-center dropbtn" style="padding: .5rem;">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#ce7f20" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                  </svg>
                  <span>&nbsp;<a href="/Online-Orders/logout">Logout</a></span>
                </div>
              </div>
            </div>
          </li>
          <li class="global--nav__items"><a href="/Online-Orders/help" class="d-flex d-col" style="font-size: 13px;">
              <div class="d-flex d-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="21" fill="currentColor" class="bi bi-question-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                  <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                </svg>
              </div> Help
            </a></li>
          <li><span id="main"> <span style="font-size: 20px; cursor: pointer" onclick="openNav()">&#9776;</span>
            </span></li>

        </ul>
      </div>
   	  <span style="font-size: 20px; cursor: pointer" onclick="openNav()" id="second--ham">&#9776;</span>
    </div>
  </div>
</body>


<script>
	function openNav() {
		
		document.getElementById("mySidenav").style.width = "250px";
		// 		document.getElementById("main").style.marginLeft = "250px";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft = "0";
	}
	let dropBtn = document.getElementById("drop--btn");
	dropBtn.addEventListener("click", () => {
		 document.getElementById("myDropdown").classList.toggle("show");
	})
	
	// this code hide the dropdown when clicked somewhere on the screen
 window.onclick = (e) => {
	if (!e.target.matches(".dropbtn")) {
		let btn = document.getElementById("myDropdown");
		if (btn.classList.contains("show"))
			btn.classList.remove("show");
	}
 }
</script>
</html>