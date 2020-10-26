<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User</title>
</head>
<body>
    <center>
        <h1>User Add</h1>
       <!--  <h2>
            <a href="/user/addUser/open">Add New User</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/rep/user/getAllUser">List All User</a>
             
        </h2> -->
    </center>
    <div align="center">
     <%--    <c:if test="${u != null}">
            <form action="/user/addUser/update" method="post">
        </c:if> --%>
        <c:if test="${u == null}">
              <form:form  modelAttribute="user" method = "POST" action = "${pageContext.request.contextPath}/add"   >
        

             <%-- <form action="${pageContext.request.contextPath}/add/saveUser"  method="post"> --%>
    
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                   <%--  <c:if test="${u != null}">
                        Edit User
                    </c:if> --%>
                    <c:if test="${u == null}">
                        Add New User
                    </c:if>
                </h2>
            </caption>
                <c:if test="${u != null}">
                    <input type="hidden" name="userId" value="<c:out value='${u.userId}' />" />
               
                </c:if>           
            <tr>
                <th>First Name: </th>
                <td>
                    <input type="text" name="firstName" size="45"
                            value="<c:out value='${u.firstName}' />"
                        />
                </td>
            </tr>
            
             <tr>
                <th>Middle Name: </th>
                <td>
                    <input type="text" name="middleName" size="45"
                            value="<c:out value='${u.middleName}' />"
                        />
                </td>
            </tr>
            
             <tr>
                <th>Last Name: </th>
                <td>
                    <input type="text" name="lastName" size="45"
                            value="<c:out value='${u.lastName}' />"
                        />
                </td>
            </tr>
            
             <tr>
                <th>Email: </th>
                <td>
                    <input type="text" name="emailId" size="45"
                            value="<c:out value='${u.emailId}' />"
                        />
                </td>
            </tr>
            
            <tr>
                <th>Password: </th>
                <td>
                    <input type="text" name="password" size="45"
                            value="<c:out value='${u.password}' />"
                        />
                </td>
            </tr>
            
             <tr>
                <th>User Name: </th>
                <td>
                    <input type="text" name="username" size="45"
                            value="<c:out value='${u.username}' />"
                        />
                </td>
            </tr>
            
             <tr>
                <th>Address: </th>
                <td>
                    <input type="text" name="currentAddress" size="45"
                            value="<c:out value='${u.currentAddress}' />"
                        />
                </td>
            </tr>
            
            
            <tr>
                <th>Phone: </th>
                <td>
                    <input type="text" name="phoneNumber" size="45"
                            value="<c:out value='${u.phoneNumber}' />"
                        />
                </td>
            </tr>
            
            
           <%--  <tr>
                <th>Author: </th>
                <td>
                    <input type="text" name="author" size="45"
                            value="<c:out value='${book.author}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                    <input type="text" name="price" size="5"
                            value="<c:out value='${book.price}' />"
                    />
                </td>
            </tr> --%>
            <tr>
                <td colspan="2" align="center">
                   <!--  <input type="submit" value="Save" /> -->
                   
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </td>
            </tr>
        </table>
        </form:form>
            </c:if>
    </div>   
</body>
</html>