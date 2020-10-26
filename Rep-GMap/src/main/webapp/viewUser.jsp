	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User</title>
</head>
<body>
   <%--  <center>
        <h1>User View</h1>
        <h2>
            <a href="/rep/user/addUser/open">Add New User</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/rep/user/getAllUser">List All User</a>
             
        </h2>
    </center> --%>
    <div align="center">
        <%-- <c:if test="${u != null}">
            <form action="/rep/user/addUser/update" method="post">
        </c:if>
        <c:if test="${u == null}">
            <form action="/rep/user/addUser/save" method="post">
        </c:if> --%>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    <c:if test="${u != null}">
                        View User
                    </c:if>
                    
                </h2>
            </caption>
                <c:if test="${u != null}">
                    <input type="hidden" name="userId" value="<c:out value='${u.userId}' />" />
               
                </c:if>           
            <tr>
                <th>First NAme: </th>
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
            
           <%--  <tr>
                <th>Password: </th>
                <td>
                    <input type="text" name="password" size="45"
                            value="<c:out value='${u.password}' />"
                        />
                </td>
            </tr> --%>
            
             <tr>
                <th>User Login Id: </th>
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
            
            
            
        </table>
        </form>
        
         <a href="/user/getAllUser">Back</a>
    </div>   
</body>
</html>