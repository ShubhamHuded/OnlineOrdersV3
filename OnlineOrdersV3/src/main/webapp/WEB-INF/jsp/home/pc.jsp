<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BRPL | Online Orders</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css"
    />
    <link rel="stylesheet" type="text/css" href="../Online-Orders/css/style.css" />
    <link rel="stylesheet" href="../Online-Orders/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css"
      integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY="
      crossorigin="anonymous"
    />
    <script src="../Online-Orders/javascript/Ztime.js"></script>
    <script src="../Online-Orders/javascript/OrderDisplayList.js"></script>
    <script src="../Online-Orders/javascript/modal.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src = "../Online-Orders/javascript/jquery.js"></script>
  </head>
  <body>
    <div>
      <div id="trading-window"></div>
      <jsp:include page="./headerDate.jsp" />
      <jsp:include page="./NavigationBar.jsp" />
      <custom-modal
        width="300"
        data-modal-src="/Online-Orders/select-type"
        class="type--modal"
        data-call-fun="openModal"
      ></custom-modal>
      <custom-modal
        width="1000"
        data-modal-src="/Online-Orders/trade?gold=45"
        data-id="trading--modal"
        class="trading"
      ></custom-modal>
      <custom-modal
        width="1000"
        height="500"
        data-modal-src="/Online-Orders/get-order-details"
        data-id="openorder-modal"
        class="openorder-modal"
        data-call-fun="openOrder"
      ></custom-modal>
      <custom-modal
        width="1000"
        height="500"
        data-modal-src="/Online-Orders/get-pending-details"
        data-id="pendorder-modal"
        class="pendorder-modal"
        data-call-fun="pendOrder"
      ></custom-modal>
      <custom-modal
        width="1000"
        height="500"
        data-modal-src="/Online-Orders/get-pending-details"
        data-id="apiorderdeatils"
        class="apiorderdeatils"
        data-call-fun="apiorderdeatils"
      ></custom-modal>

      <div style="width: 60%; margin: 0 auto">
        <div class="d-flex d-center">
          <jsp:include page="../util/MarketTime.jsp" flush="true" />
        </div>
        <div
          class="clear"
          id="clear"
          style="margin: 15px"
          data-eve-reg="click,rowClick"
        ></div>
      </div>
      <a href="./admin/dashboard">DashBoard</a>
      <div class = "d-flex btn--order">
        <button data-eve-reg = "click,openOrder" data-modal-view >Order Details</button>
        <button data-eve-reg = "click,pendOrder" data-modal-view >Pending Order</button>
        <button>Canceled Order</button>
        <button data-eve-reg = "click,apiorderdeatils" data-modal-view >API Order Details</button>
      </div>
      <jsp:include page="./footer.jsp" />
      <script>
        $(".openorder-modal").change(function () {
          console.log("data is changed");
        });

        $(document).ready(function () {
          var sanjax = setInterval("SANAjax();", 3600000000);

          setInterval("Ztime(document,'+5.50','-0.00','-5.00');", 2000);

          $(function () {
            SANAjax = function () {
              clearInterval(sanjax);
              $.ajax({
                type: "POST",
                dataType: "html",
                url: "/Online-Orders/live-rates",
                data: "id=1",
                success: function (html) {
                  $("#clear").html(html);
                  SANAjaxStart();
                },
                error: function () {
                  SANAjaxStart();
                },
              });
            };
          });

          $(function () {
            SANAjaxStart = function () {
              sanjax = setInterval("SANAjax();", 2000);
            };
          });
        });
      </script>
      <script src="../Online-Orders/javascript/HomeUtil.js" type="module" defer></script>
    </div>
  </body>
</html>
