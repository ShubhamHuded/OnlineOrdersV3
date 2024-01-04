<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BRPL | Online Orders</title>
	<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js" defer></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="../Online-Orders/css/style.css" />	
<link rel="stylesheet"  type="text/css" href="../Online-Orders/css/owl.carousel.min.css" />
<script src = "../Online-Orders/javascript/jquery.js" ></script>
<script src = "../Online-Orders/javascript/owl.carousel.min.js"></script>
<script src="../Online-Orders/javascript/Ztime.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>

	/* Style to make the carousel full-screen */
#top-banners {
    position: relative;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1; 
	margin-top: 10px;
}

/* Make sure the images cover the entire slide area */
#top-banners .item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Hide navigation controls and dots */
#top-banners .owl-nav,
#top-banners .owl-dots {
    display: none;
}

.fcfs-form, .sticky-sidebar.social-links {
	background: no-repeat padding-box #fff;
	box-shadow: 0 3px 6px #00000029;
}

.top-banner-panel {
	margin-top: -7%;
	height: 540px;
}

.fcfs-form {
	border-radius: 34px;
}



</style>
<body>
		<jsp:include page="./headerDate.jsp"/>
		<div id="includedContent" style="background-color: #fff;"></div>
		<jsp:include page="./SignUpNavBar.jsp" />
		<marquee style="color: green; font-weight: 600;">open
			Take an advantage of discounted making charges by opening an online order account with us. Registration for the offer will be starting soon.
		</marquee>
			<main class="mt-2">
				<div id="top-banners" class="owl-carousel">
					<div class="item active">
						<img src="../Online-Orders/images/firstBanner.svg" alt="fb"
							class="d-md-block d-none" /> 
						<img src="../Online-Orders/images/firstBanner.svg" alt="fb"
							class="d-md-none" />
					</div>
					<div class="item active">
						<img src="../Online-Orders/images/Banners1.jpg" alt="fb"
							class="d-md-block d-none" /> <img
							src="../Online-Orders/images/Banners1.jpg" alt="fb" class="d-md-none" />
					</div>
					<div class="item active">
						<img src="../Online-Orders/images/Banners2.jpg" alt="fb"
							class="d-md-block d-none" />
					</div>
		
				</div>

				<!-- <div id="top-banners" class="owl-carousel">
				<div class="item ">
						<img src="../Online-Orders/Online-Orders/images/firstBanner.svg" alt="fb"
							class="d-md-block d-none" /> <img
							src="../Online-Orders/Online-Orders/images/firstBanner.svg" alt="fb"
							class="d-md-none" />
					</div>
					<div class="item ">
						<img src="../Online-Orders/Online-Orders/images/Banners1.jpg" alt="fb"
							class="d-md-block d-none" /> <img
							src="../Online-Orders/images/Banners1.jpg" alt="fb" class="d-md-none" />
					</div>
					<div class="item">
						<img src="../Online-Orders/Online-Orders/images/Banners2.jpg" alt="fb"
							class="d-md-block d-none" />
					</div>
				</div> -->
				
				<div class="container"
					style="position: relative; z-index: 100;">
					<div class="col-12 top-banner-panel">
						<div class="fcfs-form p-4">
							<div class="col-12 py-0 py-md-4 "
								style="position: relative;">
								<div class="my-md-3 my-3 mx-md-3">
									<div class="d-flex justify-content-center mb-4"><jsp:include
											page="../util/MarketTime.jsp" flush="true" /></div>
									<div id="clear" class="d-flex d-center"></div>
								</div>
		
							</div>
						</div>
					</div>
				</div>
		
		
				<section>
					<jsp:include page="../util/accOpenMsg.jsp" />
					<jsp:include page="./footer.jsp" />
				</section>
		</main>
				<script
				src="https://www.pw.live/version14/assets/js/bootstrap.bundle.js"></script>
			<script
				src="https://www.pw.live/version14/assets/js/internal-custom.js"></script>
			<script
				src="https://www.pw.live/version14/assets/js/common.js"></script>
			<script
				src="https://www.pw.live/version14/assets/js/jquery.waypoints.js"></script>
		
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.3/owl.carousel.js"></script>
			<script>
					$('#top-banners').owlCarousel({
			autoplay : true,
			// animateIn: 'fadeIn',
			// animateOut: 'fadeOut',
			drag : false,
			autoplayHoverPause : false,
			loop : true,
			dots : true,
			// margin: 10,
			autoplayTimeout : 8000, //dd-20221109
			responsiveClass : true,
			nav : true,
			// stagePadding: 100,
			responsive : {
				10 : {
					items : 1
				},
				568 : {
					items : 1
				},
				600 : {
					items : 1
				},
				1000 : {
					items : 1
				}
			}
		})
		$('#result-banner.owl-carousel').owlCarousel({
			autoplay : true,
			//animateIn: 'fadeIn',
			//animateOut: 'fadeOut',
			dragEndSpeed : 1000,
			autoplayTimeout : 5000, //dd-20221109
			smartSpeed : 450,
			drag : false,
			autoplayHoverPause : true,
			loop : true,
			dots : true,
			// margin: 10,
			responsiveClass : true,
			nav : false,
			// stagePadding: 100,
			responsive : {
				10 : {
					items : 1
				},
				568 : {
					items : 1
				},
				600 : {
					items : 1
				},
				1000 : {
					items : 1
				}
			}
		})

		$('.owl-carousel').owlCarousel({
			autoplay : true,
			autoplayTimeout : 5000, //dd-20221109
			autoplayHoverPause : true,
			loop : true,
			margin : 20,
			responsiveClass : true,
			nav : true,
			loop : true,
			//stagePadding: 100,
			responsive : {
				10 : {
					items : 1
				},
				568 : {
					items : 1
				},
				600 : {
					items : 1
				},
				1000 : {
					items : 2
				}
			}
		})
				</script>
<script>

	$(document).ready(function() {
		var sanjax = setInterval("SANAjax();", 3600000000);

		setInterval("Ztime(document,'+5.50','-0.00','-5.00');", 2000);

		$(function() {
			SANAjax = function() {
				clearInterval(sanjax);
				$.ajax({
					type : "POST",
					dataType : "html",
					url : "./live-rates",
					data : "id=1",
					success : function(html) {
						$("#clear").html(html);
						SANAjaxStart();
					},
					error : function() {
						SANAjaxStart();
					},
				});
			};
		});

		$(function() {
			SANAjaxStart = function() {
				sanjax = setInterval("SANAjax();", 2000);
			};
		});
	});
	(function() {
		var cookies = document.cookie.split("; ");
		for (var c = 0; c < cookies.length; c++) {
			var d = window.location.hostname.split(".");
			while (d.length > 0) {
				var cookieBase = encodeURIComponent(cookies[c].split(";")[0]
						.split("=")[0])
						+ "=; expires=Thu, 01-Jan-1970 00:00:01 GMT; domain="
						+ d.join(".") + " ;path=";
				var p = location.pathname.split("/");
				document.cookie = cookieBase + "/";
				while (p.length > 0) {
					document.cookie = cookieBase + p.join("/");
					p.pop();
				}
				d.shift();
			}
		}
	})();

	function showLogin() {
		location.replace("app/login");
	}
	
	document.getElementById("clear").addEventListener("click" ,e => {
		Swal.fire('Need to sign in for placing orders')
	})
</script>
</body>
</html>