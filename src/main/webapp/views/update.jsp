<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>Library Management</title>
<body>
	<h2>Update User</h2>
	<c:if test="${not empty msg}">
        ${msg}
    </c:if>
	<h3>Update User</h3>
	<form method="POST" name="update_user"
		action="<%=request.getContextPath()%>/update/user">
		<input hidden="hidden" name="id" value="${id}" type="text" />
		Name: <input name="name" value="${user.name}" type="text" /> <br /> <br />
		<input hidden="hidden" name="username" value="${user.username}" />
		<input hidden="hidden" name="password" value="${user.password}" />
		Email: <input name="email" value="${user.email}" type="text" /> <br /> <br />
		<input value="Update User" type="submit" />
	</form>
</body>
</html>