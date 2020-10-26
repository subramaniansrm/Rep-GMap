<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${contextPath}/resources/img/logo/logo.png" rel="icon">
  <title>RGMS - Upload Page</title>
  <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
   <!-- Bootstrap DatePicker -->  
   <link href="${contextPath}/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" >
   <!-- Bootstrap Touchspin -->
   <link href="${contextPath}/resources/vendor/bootstrap-touchspin/css/jquery.bootstrap-touchspin.css" rel="stylesheet" >
  <link href="${contextPath}/resources/css/geoadmin.css" rel="stylesheet">
  
</head>

<body id="page-top">
 
<% Cookie[] cookie=request.getCookies();

String userName="";
for (int i = 0; i < cookie.length; i++) {
   if(cookie[i].getName().equals("userName"))
   {
	   userName=cookie[i].getValue();
   }
 }

String localfilepath="";
for (int i = 0; i < cookie.length; i++) {
if(cookie[i].getName().equals("filePath"))
{
localfilepath=cookie[i].getValue();
}
}

%>

  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${contextPath}/resources/index.html">
        <div class="sidebar-brand-icon">
          <img src="${contextPath}/resources/img/logo/RGMS_Logo_Dark_BG23oct2020.png">
        </div>
        <!-- <div class="sidebar-brand-text mx-3">RGMS</div> -->
      </a>
      <hr class="sidebar-divider my-0">
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      <hr class="sidebar-divider"> -->
     
     
      <li class="nav-item">
        <a class="nav-link" href="user.html">
          <i class="fas fa-fw fa-user"></i>
         
          <span>Users</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-file-upload"></i>
         
          <span>Upload</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="/readAddress">
          <i class="fas fa-map-marked-alt"></i>
         
          <span>GeoMap</span>
        </a>
      </li>


      <hr class="sidebar-divider">
      
      <div class="version" id="version-geoadmin"></div>
    </ul>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
          <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3 invertcolor">
            <i class="fa fa-bars"></i>
          </button>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle invertcolor" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw invertcolor"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-1 small" placeholder="What do you want to look for?"
                      aria-label="Search" aria-describedby="basic-addon2" style="border-color: #3f51b5;">
                    <div class="input-group-append">
                      <button class="btn btn-primary " type="button">
                        <i class="fas fa-search fa-sm "></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
            
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <img class="img-profile rounded-circle" src="${contextPath}/resources/img/boy.png" style="max-width: 60px">
                <span class="ml-2 d-none d-lg-inline invertcolor small"><%=userName%></span>
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="${contextPath}/resources/changepassword.html">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Change Password
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- Topbar -->

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4 border-bottom">
            <h1 class="h5 mb-0 text-gray-800">Real Estate Upload Data</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item">Pages</li>
              <li class="breadcrumb-item active" aria-current="page">Real Estate Upload Data</li>
            </ol>
          </div>

          <div class="row">
          <form:form method = "POST" action = "${pageContext.request.contextPath}/upload" enctype="multipart/form-data"  >
            <div class="col-lg-12">
              <div class="card mb-4">
                 
                <div class="card-body">
                  <div class="row">
                
                  <div class="col-lg-4">
                  <div class="form-group" id="simple-date1">
                    <label for="simpleDataInput">Uploaded Date <span class="text-Red">*</span></label>
                      <div class="input-group date">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                        </div>
                        <input type="text" class="form-control valid " name="dateVal"  id="simpleDataInput"  required>
                        <div class="invalid-feedback">
                          Please provide a valid date.
                        </div>
                      </div>
                  </div>
                  </div>
                  <div class="col-lg-4 text-left">
                    <label for="simpleDataInput"> &nbsp;</label>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-gray-500" id="basic-addon3">Local path :</span>
                      </div>
                      <input type="text" class="form-control" id="basic-url" placeholder=" " name="filePath" value=<%=localfilepath%> >
                    </div>
                  </div>
                  <div class="col-lg-4 text-left">
                    <label for="simpleDataInput" style="display: block;">&nbsp;</label>
                    <button type="submit" class="btn btn-primary" >Upload</button>
                   <%--  <c:out value="${message}"/> --%>
                    <p id="t1">${message}</p>
             
                   
                    </div>
                    <span>${error}</span>
                  </div>
             
                  
                </div>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="card mb-4">
                
                <div class="card-body">
                  <div class="col-lg-12">
                    <div class="file-container">
                      <div class="file-wrapper">
                        
                        <input class="file-input" id="js-file-input" name="files" type="file" multiple>
                        <div class="file-content">
                            <div class="file-infos">
                                <p class="file-icon">
                                  <i class="fas fa-file-upload fa-7x"></i>
                                  <span class="icon-shadow"></span>
                                  <span>
                                    Click to browse
                                    <span class="has-drag">
                                      or drop file here
                                    </span>
                                  </span>
                                </p>
                            </div>
                            <p class="file-name" id="js-file-name">No file selected</p>
                        </div>
                      </div>
                    </div>
                    </div>
                    </div>

              </div>
              </div>
              </form:form>
          </div>

          <!-- Modal Logout -->
          <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                 <%--  <a href="${contextPath}/resources/login.html" class="btn btn-primary">Logout</a> --%>
                  <a href="${contextPath}/logout" class="btn btn-primary">Logout
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  </a>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - developed by
              <b><a href="#" target="_blank">RGMS</a></b>
            </span>
          </div>
        </div>
      </footer>
      <!-- Footer -->
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Bootstrap Datepicker -->
    <script src="${contextPath}/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <!-- Bootstrap Touchspin -->
    <script src="${contextPath}/resources/vendor/bootstrap-touchspin/js/jquery.bootstrap-touchspin.js"></script>
  
  <script src="${contextPath}/resources/js/geoadmin.js"></script>
  <script>
    $(document).ready(function () {


     
      // Bootstrap Date Picker
      $('#simple-date1 .input-group.date').datepicker({
        format: 'dd/mm/yyyy',
        todayBtn: 'linked',
        todayHighlight: true,
        autoclose: true,        
      });

      $('#simple-date2 .input-group.date').datepicker({
        startView: 1,
        format: 'dd/mm/yyyy',        
        autoclose: true,     
        todayHighlight: true,   
        todayBtn: 'linked',
      });

      $('#simple-date3 .input-group.date').datepicker({
        startView: 2,
        format: 'dd/mm/yyyy',        
        autoclose: true,     
        todayHighlight: true,   
        todayBtn: 'linked',
      });

      $('#simple-date4 .input-daterange').datepicker({        
        format: 'dd/mm/yyyy',        
        autoclose: true,     
        todayHighlight: true,   
        todayBtn: 'linked',
      });    

      // TouchSpin

      $('#touchSpin1').TouchSpin({
        min: 0,
        max: 100,                
        boostat: 5,
        maxboostedstep: 10,        
        initval: 0
      });

      $('#touchSpin2').TouchSpin({
        min:0,
        max: 100,
        decimals: 2,
        step: 0.1,
        postfix: '%',
        initval: 0,
        boostat: 5,
        maxboostedstep: 10
      });

      $('#touchSpin3').TouchSpin({
        min: 0,
        max: 100,
        initval: 0,
        boostat: 5,
        maxboostedstep: 10,
        verticalbuttons: true,
      });

      

    });

    (function () {
   
   window.supportDrag = function() {
      let div = document.createElement('div');
    
      return (('draggable' in div) || ('ondragstart' in div && 'ondrop' in div)) && 'FormData' in window && 'FileReader' in window;
   }();
   
   let input =  document.getElementById('js-file-input');
   var ul = document.createElement('ul');
      const listerap  = document.getElementById('js-file-name');
   if(!supportDrag){
      document.querySelectorAll('.has-drag')[0].classList.remove('has-drag');
   }
   
   input.addEventListener("change", function(e){      
     console.log(this.files,"this.files")
    // document.getElementById('js-file-name').appendChild(ul)
     // document.getElementById('js-file-name').innerHTML = this.files[0].name;     
     document.getElementById('js-file-name').innerHTML =""
      for(var i=0; i<this.files.length; i++){
        var li=document.createElement('li');
        li.innerHTML = this.files[i].name
        ul.appendChild(li);
      }
      listerap.appendChild(ul)
      document.querySelectorAll('.file-input')[0].classList.remove('file-input--active');
   }, false);
   
   if(supportDrag){   
      input.addEventListener("dragenter", function(e) {
         document.querySelectorAll('.file-input')[0].classList.add('file-input--active');
      });

      input.addEventListener("dragleave", function(e) {
         document.querySelectorAll('.file-input')[0].classList.remove('file-input--active');
      });
   }
   
})();
        
   

    
  </script>

</body>

</html>

<%-- 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
      <meta charset="utf-8">
      <title>List</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
      <style>
    .error 
    {
        color: #ff0000;
        font-weight: bold;
    }
    </style>
  </head>

<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
   <body>
      <h2>Real Estate Upload Data</h2>
      <form:form method = "POST" action = "${pageContext.request.contextPath}/upload" enctype="multipart/form-data"  >
      `<input type="date" id="start" name="dateVal"
       value="" pattern="yyyy-MM-dd"
       min="2020-01-01" max="2020-12-31">
           <br/> <br/>
           
      <label for="input-folder-1">Upload File From Folder</label>
    <input id="input-folder-1"  type="file"  name="files"  webkitdirectory="" directory="" >
    <br/><br/>
    
         <input type="file" name="files"  multiple/><br/><br/>
    <input type="submit" value="Submit" />
      </form:form>
       <div th:if="${message}">
        <h2 th:text="${message}"/>
    </div>
   </body>
   
   
</html> --%>