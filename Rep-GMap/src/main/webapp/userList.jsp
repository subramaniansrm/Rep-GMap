	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User</title>
</head>
<body>
    <center>
        <h1> User Management</h1>
        <h2>
            <a href="/openSave">Add New User</a>
            &nbsp;&nbsp;&nbsp;
           <!--  <a href="/list">List All User</a> -->
             
        </h2>
    </center>
    <div align="center">
        <table border="1" >
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>User Id</th>
                <th>First Name</th>
                
                <th>Last Name</th>
                  
                <th>Address</th>
                 <th>Email Id</th>
                 <!-- <th>Password</th> -->
                 <th>Login Id</th>
                 <th>Phone</th>
                 
                <th>Actions</th>
            </tr>
            <c:forEach var="u" items="${user}">
                <tr>
                    <td><c:out value="${u.userId}" /></td>
                    <td><c:out value="${u.firstName}" /></td>
                    <td><c:out value="${u.lastName}" /></td>
                    <td><c:out value="${u.currentAddress}" /></td>
                    <td><c:out value="${u.emailId}" /></td>
                   <%--  <td><c:out value="${u.password}" /></td> --%>
                    <td><c:out value="${u.username}" /></td>
                     <td><c:out value="${u.phoneNumber}" /></td>
                    <td>
                        <a href="/openUpdate?userId=<c:out value='${u.userId}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                         <a href="/openView?userId=<c:out value='${u.userId}' />">View</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <a href="/delete?userId=<c:out value='${u.userId}' />">Delete</a>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>   
</body>
</html>