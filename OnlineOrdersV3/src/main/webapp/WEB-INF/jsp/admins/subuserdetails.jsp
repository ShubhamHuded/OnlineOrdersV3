<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Subuser details</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css"
    />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
  </head>
  <body>
    <div id="spinid"></div>
    <div class="d-flex justify-content-between">
      <div>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="25"
          height="25"
          fill="currentColor"
          class="bi bi-person"
          viewBox="0 0 16 16"
        >
          <path
            d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"
          />
        </svg>
        <h4 class="ml-1 mt-5 d-inline">Sub User Details</h4>
      </div>
      <div style="margin-right: 10%" data-eve-reg="click,editForm">
        <a role = "button"
          ><svg
            xmlns="http://www.w3.org/2000/svg"
            width="20"
            height="20"
            fill="currentColor"
            class="bi bi-pencil"
            viewBox="0 0 16 16"
          >
            <path
              d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"
            />
          </svg>
          <p class="ml-1 d-inline">Edit</p></a
        >
      </div>
    </div>
    <form class="sub--form" id="subForm" action="/Online-Orders/subuser-profile-data">
      <div class="container">
        <div class="row justify-content-center">
          <div class="one col-lg-10 mt-2">
            <div class="form-group">
              <div class="d-flex justify-content-between mt-2">
                <div class="col-5">
                  <label for="userFirstName" class="p-1"
                    >First Name<span class="reg--require"> *</span>
                  </label>
                  <input
                    id="userfirstName"
                    name="userFirstName"
                    type="text"
                    class="form-control form-control-sm"
                    value="${empty subuser ? '' : subuser.userFirstName}"
                    data-mandatory="true"
                    data-event="focus,removeWarning"
                  />
                </div>
                <div class="col-5">
                  <label for="userlastNames" class="p-1"
                    >Last Name<span class="reg--require"> *</span>
                  </label>
                  <input
                    id="userlastNames"
                    name="userLastName"
                    type="text"
                    class="form-control form-control-sm"
                    value="${empty subuser ? '' : subuser.userFirstName}"
                    data-mandatory="true"
                    data-event="focus,removeWarning"
                  />
                </div>
              </div>
              <div class="d-flex justify-content-between mt-2">
                <div class="col-5">
                  <label for="userEmailId" class="p-1"
                    >Email<span class="reg--require"> *</span></label
                  >
                  <input
                    id="userEmailId"
                    name="userEmailId"
                    type="text"
                    class="form-control form-control-sm"
                    value="${empty subuser ? '' : subuser.userEmailId}"
                    data-mandatory="true"
                    data-check
                    data-event="blur focus,emailValidator removeWarning"
                    ${empty subuser ? '' : 'disabled'}
                  />
                </div>
                <div class="col-5">
                  <label for="userPassword" class="p-1"
                    >Password<span class="reg--require"> *</span></label
                  >
                  <input
                    type="password"
                    id="userPassword"
                    name="userPassword"
                    class="form-control form-control-sm"
                    value="${empty subuser ? '' : '*********'}"
                    data-mandatory="true"
                    data-check
                    data-event="blur focus,validatePassword removeWarning"
                    ${empty subuser ? '' : 'disabled'}
                  />
                </div>
              </div>
              <div class="d-flex justify-content-between mt-2">
                <div class="col-5">
                  <label for="userMobile" class="p-1"
                    >Mobile Number<span class="reg--require"> *</span>
                  </label>
                  <input
                    id="userMobile"
                    name="userMobile"
                    type="text"
                    class="form-control form-control-sm"
                    value="${empty subuser ? '' : subuser.userMobile}"
                    data-mandatory="true"
                    data-check
                    data-event="blur focus,mobileNoValidator removeWarning"
                  />
                </div>
                <div class="col-5 mt-4">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      value=""
                      id="AllowTrading"
                      name="allowTrading"
                      ${subuser.tradingEnabeld ? 'checked' : ''}
                    />
                    <label class="form-check-label" for="AllowTrading">
                      Allow Trading</label
                    >
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      value=""
                      id="AllowPending"
                      name="allowPending"
                      ${subuser.allowPendingorder ? 'checked' : ''}
                    />
                    <label class="form-check-label" for="AllowPending">
                      Allow Pending Order
                    </label>
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      value=""
                      id="AllowSales"
                      name="allowSales"
                      ${subuser.allowSales ? 'checked' : ''}
                    />
                    <label class="form-check-label" for="AllowSales">
                      Allow Sales
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="mt-4">
              <table data-form-table class="table" id="subTable">
                <thead data-table-head>
                  <tr>
                    <th data-col-name="currency" data-col-type="select">
                      Curency
                    </th>
                    <th data-col-name="maxOrderQty" data-col-type="input">
                      Max Order Qty
                    </th>
                    <th data-col-name="totalOrderQty" data-col-type="input">
                      Total Order Qty
                    </th>
                    <th
                      data-col-name="edit"
                      data-col-type="button"
                      data-col-child="Delete"
                    >
                      edit
                    </th>
                  </tr>
                </thead>
                <c:choose>
                  <c:when test="${empty subuserList}">
                    <tbody data-table-body></tbody>
                  </c:when>
                  <c:otherwise>
                    <tbody>
                      <c:forEach items="${subuserList}" var="item" >
                        <tr>
                          <td>${item.currency}</td>
                          <td>${item.maxOrderQty}</td>
                          <td>${item.totalOrderQty}</td>
                          <td>
                            <input type="button" value="Delete" name="" id="" data-label="editOrDelet" disabled="" data-event="click,handleRowDelet">
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </c:otherwise>
                </c:choose>
              </table>
              <div class="d-flex justify-content-between">
                <button data-label="row-add" data-eve-reg="click,addRow">
                  Add row
                </button>
                <button data-label="submit" data-eve-reg="click,submit">
                  Submit
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
    <script src="../Online-Orders/javascript/subuserfrom.js" type="module"></script>
  </body>
</html>
