<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>Library Management</title>
<head>
	<title>Login page</title>
	<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>List of users</h2>
	<a href="<%=request.getContextPath()%>/addUser">Add</a>
	<c:if test="${not empty msg}">
        ${msg}
    </c:if>
	<c:choose>
		<c:when test="${users != null}">
			<h3>List of Users</h3>
			<table cellpadding="5" cellspacing="5">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>UserName</th>
						<th>Password</th>
						<th>email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="t" items="${users}">
						<tr>
							<td>${t.id}</td>
							<td>${t.name}</td>
							<td>${t.username}</td>
							<td>${t.password}</td>
							<td>${t.email}</td>
							<td><a href="<%=request.getContextPath()%>/user/${t.id}">Details</a>
								<a href="<%=request.getContextPath()%>/update/user/${t.id}">Update</a>
								&nbsp; <a href="<%=request.getContextPath()%>/delete/user/${t.id}"
								onclick="return confirm('Do you really want to delete?')">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
        No User found in the DB!
        </c:otherwise>
	</c:choose>
</body>
</html>