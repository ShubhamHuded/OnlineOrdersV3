<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
    <script
    src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>
  <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
</head> 
<body>
    <style>
        @charset "UTF-8";
@import 'https://static.stayjapan.com/assets/dashboard/application-33c1a06b7784b53cd746d479718b6295c0fcefebb696e78dcee7c68efc92fada.css';
.horizontal-container {
  margin: 0 auto;
  width: 100%;
  /* Create circle */
  /* Create line */
  /* Custom progress bar */
}
@media (min-width: 768px) {
  .horizontal-container {
    width: 500px;
  }
}
.horizontal-container .progress-bar-container {
  position: relative;
}
.horizontal-container .progress-bar-container .custom-progress-bar {
  counter-reset: step; /* Initial step: 0 */
  padding-left: 0;
}
.horizontal-container .progress-bar-container .custom-progress-bar li {
  float: left;
  font-size: 12px;
  list-style: none;
  position: relative;
  text-align: center;
  text-transform: uppercase;
  width: 50%;
}
.horizontal-container .progress-bar-container .custom-progress-bar li:before {
  background-color: white;
  border-radius: 50%;
  border: 2px solid #ccc;
  color: #ccc;
  display: block;
  height: 20px;
  line-height: 18px;
  margin: 0 auto;
  text-align: center;
  width: 20px;
  content: counter(step);
  counter-increment: step;
}
.horizontal-container .progress-bar-container .custom-progress-bar li:after {
  background-color: #e5e5e5;
  content: "";
  height: 3px;
  left: -50%;
  transform: translateX(50%);
  position: absolute;
  top: 9px;
  width: 100%;
  z-index: -1;
}
.horizontal-container .progress-bar-container .custom-progress-bar li:last-child:before {
  display: none;
}
.horizontal-container .progress-bar-container .custom-progress-bar li:last-child:after {
  display: none;
}
.horizontal-container .progress-bar-container .custom-progress-bar li.active:before {
  border-color: red;
  color: red;
}
.horizontal-container .progress-bar-container .custom-progress-bar li.finished:before {
  background-color: red;
  border-color: red;
  color: #fff;
  content: "✓";
}
.horizontal-container .progress-bar-container .custom-progress-line {
  height: 3px;
  position: absolute;
  content: "";
  top: 9px;
  left: 0;
  width: auto;
  background-color: red;
}
.horizontal-container .horizontal-form-box {
  background-color: #fff;
  border: 1px solid #e5e5e5;
  height: 466px;
  padding: 30px;
}
.horizontal-container .horizontal-form-box .horizontal-info-container img {
  height: 75px;
  margin-bottom: 20px;
}
.horizontal-container .horizontal-form-box .horizontal-info-container .horizontal-heading {
  color: #000;
  font-size: 22px;
  font-weight: bold;
  text-transform: capitalize;
}
.horizontal-container .horizontal-form-box .horizontal-info-container .horizontal-subtitle {
  letter-spacing: 1px;
  margin-bottom: 20px;
  text-align: left;
}
.horizontal-container .horizontal-form-box .horizontal-form label,
.horizontal-container .horizontal-form-box .horizontal-form button {
  text-transform: capitalize;
}
.horizontal-container .horizontal-form-box .horizontal-form label {
  color: #000;
  font-weight: normal;
}
    </style>
    <div class="container" style="margin-top: 40px;">
        <div class="row"> 
          <div class="col-sm-12">
            <div class="horizontal-container">
              <div class="horizontal-form-box">
                <div class="horizontal-info-container text-center">
                  <p class="horizontal-heading">Reset your password</p>
                </div>
                <form class="horizontal-form" action="/Online-Orders/process-new-password" method="post" id = "newpassword">
                  <input type="hidden" name="token" id="token">
                  <div class="o3-form-group">
                    <label for="new_password">New password</label>
                    <input type="password" data-pass = "" class="o3-form-control o3-input-lg" id="new_password" data-mandatory="true" data-event="blur focus,validatePassword removeWarning" name="password">
                  </div>
                  <div class="o3-form-group">
                    <label for="confirm_password">Confirm new password</label>
                    <input type="password"  data-pass = "" class="o3-form-control o3-input-lg" id="confirm_password" data-mandatory="true" data-event="blur focus,comparePassswords removeWarning">
                  </div>
                  <input type = "submit" class="o3-btn o3-btn-primary o3-btn-block" value = "Set new password" data-event="click,submit">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script src="../Online-Orders/javascript/NewResetPassword.js" type="module"></script>
</body>
</html>