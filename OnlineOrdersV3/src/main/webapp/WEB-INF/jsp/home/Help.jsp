<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css"
	href="../css/style.css" />
<style>

.customer-support {
  margin: 2rem;
  width:50%;
  margin-left:auto;
  margin-right:auto;
}

.accordion-header {
  background-color: rgb(235, 235, 235);
  background-color:#DCDCDC;
  color: black;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0px 25px;
  transition: all 0.4s ease-in-out;
  border-radius:10px;
}

.accordion-header h4 {
  font-size: 1rem;
  font-weight:500;
}

.accordion-body {
  transition: all 0.35s ease-in-out;
  max-height: 0;
  overflow: hidden;
}

.accordion-body p {
  padding: 1rem 1.5rem;
  line-height: 1.8;
  background-color:#FFF0F5;
}

.accordion + .accordion {
  margin-top: 1rem;
}

.accordion-icon {
  transition: transform 0.4s ease-in-out;
  font-size:20px;
  font-family:bold;
}

.accordion.active .accordion-header {
  background-color: rgb(40, 134, 114);
  color: white;
}

.accordion.active .accordion-icon {
  transform: rotate(-180deg);
}

</style>
</head>
<body>
    <jsp:include page="./NavigationBar.jsp" />
    <div class="customer-support">
      <h1><u class = "headinghelper">Customer support</u></h1>

      <div class="accordions-wrapper">
        <div class="accordion">
          <div class="accordion-header">
            <h4>Accordion #1</h4>
            <span class="accordion-icon">^</span>
          </div>

          <div class="accordion-body">
            <p>
            ......
            </p>
          </div>
        </div>

        <div class="accordion">
          <div class="accordion-header">
            <h4>Accordion #2</h4>
            <span class="accordion-icon">^</span>
          </div>

          <div class="accordion-body">
            <p>
           ......
            </p>
          </div>
        </div>

        <div class="accordion">
          <div class="accordion-header">
            <h4>Accordion #3</h4>
            <span class="accordion-icon">^</span>
          </div>

          <div class="accordion-body">
            <p>
             .....
            </p>
          </div>
        </div>
      </div>
    </div>


</body>
<script>
const accordionHeaders = document.querySelectorAll(".accordion-header");

ActivatingFirstAccordion();

function ActivatingFirstAccordion() {
  accordionHeaders[0].parentElement.classList.add("active");
  accordionHeaders[0].nextElementSibling.style.maxHeight =
  accordionHeaders[0].nextElementSibling.scrollHeight + "px";
}

function toggleActiveAccordion(e, header) {
  const activeAccordion = document.querySelector(".accordion.active");
  const clickedAccordion = header.parentElement;
  const accordionBody = header.nextElementSibling;

  if (activeAccordion && activeAccordion != clickedAccordion) {
    activeAccordion.querySelector(".accordion-body").style.maxHeight = 0;
    activeAccordion.classList.remove("active");
  }

  clickedAccordion.classList.toggle("active");

  if (clickedAccordion.classList.contains("active")) {
    accordionBody.style.maxHeight = accordionBody.scrollHeight + "px";
  } else {
    accordionBody.style.maxHeight = 0;
  }
}

accordionHeaders.forEach(function (header) {
  header.addEventListener("click", function (event) {
    toggleActiveAccordion(event, header);
  });
});

function resizeActiveAccordionBody() {
  const activeAccordionBody = document.querySelector(
    ".accordion.active .accordion-body"
  );
  if (activeAccordionBody)
    activeAccordionBody.style.maxHeight =
      activeAccordionBody.scrollHeight + "px";
}

window.addEventListener("resize", function () {
  resizeActiveAccordionBody();
});

</script>
</html>