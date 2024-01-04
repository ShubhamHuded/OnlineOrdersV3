<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SubUser List</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css"
    />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <script src="../Online-Orders/javascript/jquery.js"></script>
    <link rel="stylesheet" href="../Online-Orders/css/bootstrap.min.css" />
  </head>
  <body>
    <div class="main-container">
      <jsp:include page="../home/NavigationBar.jsp" />
      <div class="container">
        <span><strong>Trader Id: </strong>${name}</span>
        <button
          style="float: right"
          class="btn btn-primary mt-2"
          data-eve-reg="${isApproved ? 'click,openmodal' : 'click,warningSub'}"
        >
          Add SubUser
        </button>
      </div>
      <div class="container mt-2">
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Name</th>
              <th scope="col">User Email</th>
              <th scope="col">Mobile Number</th>
              <th scope="col">Password</th>
              <th scope="col">edit user</th>
              <th scope="col">Is Active</th>
            </tr>
          </thead>

          <c:choose>
            <c:when test="${empty subuserList}">
              <p
                style="color: red; border: 1px solid #ccc; font-weight: 800"
                class="list--warning p-4 font-weight-bold"
              >
                No SubUsers found, Add subuser...
              </p>
            </c:when>
            <c:otherwise>
              <tbody>
                <c:forEach items="${subuserList}" var="item" varStatus="status">
                  <tr>
                    <td>${status.index + 1}</td>
                    <td>${item.userFirstName}</td>
                    <td>${item.userEmailId}</td>
                    <td>${item.userMobile}</td>
                    <td>*********</td>
                    <td>
                      <div class="d-flex">
                        <p class="" role="button" data-eve-reg="click,openedit">
                          edit
                        </p>
                      </div>
                    </td>
                    <td>

                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </c:otherwise>
          </c:choose>
        </table>
      </div>
    </div>

    <jsp:include page="../home/footer.jsp" />
    <script src="../Online-Orders/javascript/Subuser.js" type="module"></script>
  </body>
</html>
