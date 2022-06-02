<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>Library Management</title>
<body>
	<h2>Add User</h2>
	<c:if test="${not empty msg}">
        ${msg}
    </c:if>
	<h3>Add User</h3>
	<form method="POST" name="add_user"
		action="<%=request.getContextPath()%>/add/user">
		Name: <input name="name" value="${name}" type="text" /> <br /> <br />
		UserName: <input name="username" value="${username}" type="text" /> <br /> <br />
		Password: <input name="password" value="${password}" type="password" /> <br /> <br />
		Email: <input name="email" value="${email}" type="text" />
		<br /> <br />
		<input value="Add User" type="submit" />
	</form>
</body>
</html>