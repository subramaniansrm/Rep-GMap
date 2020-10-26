<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html lang="en">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >  
	 
	<!-- IE Edge Meta Tag -->
   <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${contextPath}/resources/img/logo/logo.png" rel="icon">
  <title>RGMS - GEOAdmin Page</title>
  	<link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
   <!-- Bootstrap DatePicker -->  
   <link href="${contextPath}/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" >
   <!-- Bootstrap Touchspin -->
   <link href="${contextPath}/resources/vendor/bootstrap-touchspin/css/jquery.bootstrap-touchspin.css" rel="stylesheet" >
  <link href="${contextPath}/resources/css/geoadmin.css" rel="stylesheet">
 
      <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>

	 <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
     <style type="text/css">

      #map_canvas {
            height: 1000px;
   		 	margin: 30px;
    		width: 1000px;
       }   
       .label {
           color: #000;
           background-color: white;
           border: 1px solid #000;
           font-family: "Lucida Grande", "Arial", sans-serif;
           font-size: 12px;
           text-align: center;
           white-space: nowrap;
           padding: 2px;
       }
       .label.green {
           background-color: #58D400;
       }
       .label.red {
           background-color: #D80027;
           color: #fff;
       }
       .label.yellow {
           background-color: #FCCA00;
       }
       .label.turquoise {
           background-color: #00D9D2;
       }
       .label.brown {
           background-color: #BF5300;
           color: #fff;
       }
    
     #loader { 
            border: 12px solid #f3f3f3; 
            border-radius: 50%; 
            border-top: 12px solid #444444; 
            width: 70px; 
            height: 70px; 
            animation: spin 1s linear infinite; 
        } 
          
        @keyframes spin { 
            100% { 
                transform: rotate(360deg); 
            } 
        } 
          
        .center { 
            position: absolute; 
            top: 0; 
            bottom: 0; 
            left: 0; 
            right: 0; 
            margin: auto; 
        } 
    
       .lable {
         	display: inline-block;
    		width: 100px;
    		font-weight: bold;    
		}
		.lablerow{
			display:block;
			padding:3px 0;
			color: #055173;
		}
		.lablerow:nth-child(odd){
    		background: #e9f2f154;
		}
		.navbut{
			background: #f05805;
    		color: #f4f3f3;
    		border: 0;
    		padding: 5px 20px;
    		border-radius: 7px;
    		display: inline-block;
    		margin-right: 30px;	
		}

  </style>
     
       <script type="text/javascript">   

function initialize(){                       
       
     var markers = [
                     <c:forEach var="s" items="${fileParams}">                                               
                               		  <c:forEach var="list" items="${s.listDetails}" varStatus="index">                                   		
                                      ['<c:out value="${s.colorCode}"/>', <c:out value="${list.latitude}"/>,<c:out value="${list.longitude}"/>,
                                       '<c:out value="${list.propertyName}"/>', '<c:out value="${list.landArea}"/>', '<c:out value="${list.occuipedArea}"/>',
                                       '<c:out value="${list.unitPrice}"/>', '<c:out value="${list.address}"/>' , '<c:out value="${list.station}"/>', 
                                       '<c:out value="${list.traffic}"/>','<c:out value="${list.floorPlan}"/>','<c:out value="${list.fileName1}"/>','<c:out value="${list.fileName2}"/>',
                                       <c:out value="${s.latitude}"/>,<c:out value="${s.longtitude}"/> ],
                                       </c:forEach>   </c:forEach> ]; 
    
                                                                                                               
    var bp = {lat: 36.204824, lng: 138.252924};           
    var mapOptions={
        zoom: 6, 
        center: bp,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        gestureHandling: "cooperative",
    }

    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    var icons = {
    	     'Green': {
    	      //url: "https://maps.google.com/mapfiles/ms/icons/green.png",
    	       url: "${contextPath}/resources/images/一棟.png",
    	       color: '#58D400'
    	     },
    	     'Yellow': {
    	       //url:"https://maps.google.com/mapfiles/ms/icons/yellow.png",
    	     url: "${contextPath}/resources/images/戸建て.png",
    	       color: '#FCCA00'
    	     },
    	     'Red': {
    	      // url: "https://maps.google.com/mapfiles/ms/icons/red.png",
    	     url: "${contextPath}/resources/images/マンション.png",
    	       color: '#D80027'
    	     },
    	     'Gray': {
    	       //url: "https://maps.google.com/mapfiles/ms/icons/grey.png",
    	     url: "${contextPath}/resources/images/検討物件.png",
    	       color: '#00D9D2'
    	     },
    	     'Blue': {
    	      // url: "https://maps.google.com/mapfiles/ms/icons/blue.png",
    	     url: "${contextPath}/resources/images/土地.png",
    	       color: '#BF5300'
    	     },
    	         	    
    	    'DarkGreen': {
      	      // url: "https://maps.google.com/mapfiles/ms/icons/green.png",
      	   url: "${contextPath}/resources/images/成約一棟.png",
      	       color: '#58D400'
      	     },
      	     'DarkYellow': {
      	      // url: "https://maps.google.com/mapfiles/ms/icons/yellow.png",
      	   url: "${contextPath}/resources/images/成約戸建て.png",
      	       color: '#FCCA00'
      	     },
      	     'DarkRed': {
      	       //url: "https://maps.google.com/mapfiles/ms/icons/red.png",
      	   url: "${contextPath}/resources/images/成約マンション.png",
      	       color: '#D80027'
      	     },
      	     'Black': {
      	      // url: "https://maps.google.com/mapfiles/ms/icons/grey.png",
      	   url: "${contextPath}/resources/images/自社物件.png",
      	       color: '#00D9D2'
      	     },
      	     'DarkBlue': {
      	      // url: "https://maps.google.com/mapfiles/ms/icons/blue.png",
      	   url: "${contextPath}/resources/images/成約土地.png",
      	       color: '#BF5300'
      	     }    	         	         	        	         	         	     
    	   };
    
    var infowindow = new google.maps.InfoWindow(), marker, i;
    var bounds = new google.maps.LatLngBounds();      
    for (i = 0; i < markers.length; i++) {      	  
       marker = new google.maps.Marker({              
            position: new google.maps.LatLng(markers[i][1], markers[i][2]),
            map: map,
            icon: icons[ markers[i][0]].url,       
            labelClass: "label " +  markers[i][0],
            labelInBackground: true  
          });               
       
       bounds.extend(marker.getPosition());
       
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {                                                	        
            
                	        var content =            		 
                     	       "<div>" +"<div class='lablerow'><div class='lable'> " + "物件名 " +"  </div><b>: </b>"  +  markers[i][3] +  "</div>"+ 
                     	        "<div class='lablerow'><div class='lable'>  " + "面積 " +" </div><b>: </b>" + markers[i][4]+  "</div>" +   
                     	        "<div class='lablerow'><div class='lable'>  " + "占面積" +" </div><b>: </b>" + markers[i][5] +  "</div>" + 
                     	        "<div class='lablerow'><div class='lable'>  " + "単価【坪】 " +" </div><b>: </b>" + markers[i][6] +  "</div>" + 
                     	        "<div class='lablerow'><div class='lable'>  " + "住所 " +"</div><b>: </b>" +  markers[i][7] +  "</div>" + 
                     	        "<div class='lablerow'><div class='lable'>  " + "沿線駅 " +" </div><b>: </b>" + markers[i][8] +  "</div>" + 
                     	        "<div class='lablerow'><div class='lable'> " + "交通 " +" </div><b>: </b>" + markers[i][9] +  "</div>" + 
                     	        "<div class='lablerow'><div class='lable'>  " + "間取り " +" </div><b>: </b>" + markers[i][10] +  "</div>" + 
                     	        "<button onclick='pdfdownload1()' id='b1' class='navbut' value='"+markers[i][11]+"' >図面</button>" +  "        " +               	          
                     	        "<button onclick='pdfdownload2()' id='b2' class='navbut'  value='"+markers[i][12]+"' >詳細</button>" + "<div>" ;     
                	        
                infowindow.setContent(content);   
                infowindow.open(map, marker);
            }
        })(marker, i));
        map.fitBounds(bounds);
    }
}
  google.maps.event.addDomListener(window, 'load', initialize);
    
  function pdfdownload1(){
	   
	   var filename = document.getElementById("b1").value; 		       	 
		
	    $.ajax({
            cache: false,
            type: "GET",
            url: "${pageContext.request.contextPath}/download/"+filename,
            contentType : false,
            processData: false,
            data: filename,
             //xhrFields is what did the trick to read the blob to pdf
            xhrFields: {
                responseType: 'blob'
            },
            success: function (response, status, xhr) {                         
                var filename = "";                   
                var disposition = xhr.getResponseHeader('Content-Disposition');                
                                
                 if (disposition) {
                    var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
                    var matches = filenameRegex.exec(disposition);
                    if (matches !== null && matches[1]) filename = matches[1].replace(/['"]/g, '');
                }    
                var linkelem = document.createElement('a');
                try {
                    var blob = new Blob([response], { type: 'application/octet-stream' });                        

                    if (typeof window.navigator.msSaveBlob !== 'undefined') {
                        //   IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
                        window.navigator.msSaveBlob(blob, filename);
                         
                    } else {
                        var URL = window.URL || window.webkitURL;
                        var downloadUrl = URL.createObjectURL(blob);

                        if (filename) { 
                        	                        	 
                            // use HTML5 a[download] attribute to specify filename
                            var a = document.createElement("a");

                            // safari doesn't support this yet
                            if (typeof a.download === 'undefined') {
                                window.location = downloadUrl;
                            } else {
                                a.href = downloadUrl;
                                a.download = filename;
                                document.body.appendChild(a);
                                a.target = "_blank";
                                a.click();
                            }
                        } else {
                            window.location = downloadUrl;
                        }
                    }   

                } catch (ex) {
                    console.log(ex);
                } 
            }
        });  		
  }    
    
  function pdfdownload2(){
	   
	   var filename = document.getElementById("b2").value; 		       	 
		
	    $.ajax({
            cache: false,
            type: "GET",
            url: "${pageContext.request.contextPath}/download/"+filename,
            contentType : false,
            processData: false,
            data: filename,
             //xhrFields is what did the trick to read the blob to pdf
            xhrFields: {
                responseType: 'blob'
            },
            success: function (response, status, xhr) {                         
                var filename = "";                   
                var disposition = xhr.getResponseHeader('Content-Disposition');                
                                
                 if (disposition) {
                    var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
                    var matches = filenameRegex.exec(disposition);
                    if (matches !== null && matches[1]) filename = matches[1].replace(/['"]/g, '');
                }    
                var linkelem = document.createElement('a');
                try {
                    var blob = new Blob([response], { type: 'application/octet-stream' });                        

                    if (typeof window.navigator.msSaveBlob !== 'undefined') {
                        //   IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
                        window.navigator.msSaveBlob(blob, filename);
                         
                    } else {
                        var URL = window.URL || window.webkitURL;
                        var downloadUrl = URL.createObjectURL(blob);

                        if (filename) { 
                        	                        	 
                            // use HTML5 a[download] attribute to specify filename
                            var a = document.createElement("a");

                            // safari doesn't support this yet
                            if (typeof a.download === 'undefined') {
                                window.location = downloadUrl;
                            } else {
                                a.href = downloadUrl;
                                a.download = filename;
                                document.body.appendChild(a);
                                a.target = "_blank";
                                a.click();
                            }
                        } else {
                            window.location = downloadUrl;
                        }
                    }   

                } catch (ex) {
                    console.log(ex);
                } 
            }
        });  		
  }  
       
    document.onreadystatechange = function() { 
       if (document.readyState !== "complete") { 
           document.querySelector( 
             "body").style.visibility = "hidden"; 
           document.querySelector( 
             "#loader").style.visibility = "visible"; 
       } else { 
           document.querySelector( 
             "#loader").style.display = "none"; 
           document.querySelector( 
             "body").style.visibility = "visible"; 
       } 
   };   
    
   </script>	
</head>


<body onload="initialize()">

<% Cookie[] cookie=request.getCookies();
String userName="";
for (int i = 0; i < cookie.length; i++) {
   if(cookie[i].getName().equals("userName"))
   {
	   userName=cookie[i].getValue();
   }
 }
%>

    <div id="loader" class="center"></div>     
 <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon">
          <img src="${contextPath}/resources/img/logo/RGMS_Logo_Dark_BG23oct2020.png">
        </div>
      </a>
      <hr class="sidebar-divider my-0">
    
     
     
      <li class="nav-item">
        <a class="nav-link" href="user.html">
          <i class="fas fa-fw fa-user"></i>
         
          <span>Users</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="/uploadAdd">
          <i class="fas fa-fw fa-file-upload"></i>
         
          <span>Upload</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="#">
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
          <ul class="navbar-nav ml-auto" style="width:75%">
            <li class="nav-item dropdown no-arrow invertcolor mt-4 mr-2 "><label for="simpleDataInput">Select Date <span class="text-Red">*</span></label></li>
            
            <li class="nav-item dropdown no-arrow mt-3">
            <form:form method = "POST" action = "${pageContext.request.contextPath}/address/readAddress">
              <div class="form-group" id="simple-date1">
             
                  <div class="input-group date">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                    </div>
                    <input type="text" name = "dateVal" class="form-control"  id="simpleDataInput">
                  </div>
                 
              </div>
            
            </li>
            <li class="nav-item dropdown no-arrow invertcolor mt-3 ml-1"> 
            <button type="submit" class="btn btn-primary">Submit</button></li>
            <li class="nav-item dropdown no-arrow mt-3 ml-1" style="width:33%"></li>
            </form:form>
            
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
                <a class="dropdown-item" href="changepassword.html">
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
          

          <div class="row">
           
            <div class="col-lg-12">
              <div id="map_canvas" style="width:100%;height:600px;"></div>

              </div>
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
                <!--   <a href="login.html" class="btn btn-primary">Logout</a> -->
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
        format: 'dd-mm-yyyy',
        todayBtn: 'linked',
        todayHighlight: true,
        autoclose: true,        
      });

      $('#simple-date2 .input-group.date').datepicker({
        startView: 1,
        format: 'dd-mm-yyyy',        
        autoclose: true,     
        todayHighlight: true,   
        todayBtn: 'linked',
      });

      $('#simple-date3 .input-group.date').datepicker({
        startView: 2,
        format: 'dd-mm-yyyy',        
        autoclose: true,     
        todayHighlight: true,   
        todayBtn: 'linked',
      });

      $('#simple-date4 .input-daterange').datepicker({        
        format: 'dd-mm-yyyy',        
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
/*     function myMap() {
var mapProp= {
  center:new google.maps.LatLng(51.508742,-0.120850),
  zoom:5,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
} */

    (function () {
   
   window.supportDrag = function() {
      let div = document.createElement('div');
      return (('draggable' in div) || ('ondragstart' in div && 'ondrop' in div)) && 'FormData' in window && 'FileReader' in window;
   }();
   
   let input =  document.getElementById('js-file-input');
   
   if(!supportDrag){
      document.querySelectorAll('.has-drag')[0].classList.remove('has-drag');
   }
   
   input.addEventListener("change", function(e){      
      document.getElementById('js-file-name').innerHTML = this.files[0].name;     
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
   <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>  
</body>

</body>
</html>
 