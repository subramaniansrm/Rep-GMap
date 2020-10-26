<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- IE Edge Meta Tag -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${contextPath}/resources/img/logo/logo.png" rel="icon">
  <title>RGMS -  Login</title>
  <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${contextPath}/resources/css/geoadmin.css" rel="stylesheet">
</head>



<body class="bg-gradient-login">
  <!-- Login Content -->
  <div class="container-login">
    <div class="row justify-content-center">
      
      <div class="col-xl-4 col-lg-12 col-md-9">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-md-12 text-center mt-3">
                <img src="${contextPath}/resources/img/logo/RGMS_Logo_Light-BG_23oct2020.png"/>
              </div>
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login</h1>
                  </div>
                  <form class="form-signin" method="POST" action="${contextPath}/login" >
                    <div class="form-group">
                      <input type="text" name="username" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                        placeholder="User Name">
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" class="form-control" id="exampleInputPassword" placeholder="Password">
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small" style="line-height: 1.5rem;">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember
                          Me</label>
                      </div>
                    </div>
                    <div class="form-group">
                      
                      <button class="btn btn-primary btn-block" type="submit">Submit</button>
                    </div>
                  
                  
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="font-weight-bold small" href="forgotpassword.html">Forgot Password!</a>
                  </div>
                  <div class="text-center">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Login Content -->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="${contextPath}/resources/js/geoadmin.js"></script>
</body>

</html>