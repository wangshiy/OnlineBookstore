<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result Page</title>
</head>
<body>
<h1><font color="green">${userInfo.message}</font></h1>
<table width="200" border="1">
	<tr>
		<th>Username</th>
		<th>Email</th>
	</tr>
	<c:forEach var="user" items="${userInfo.users}">
		<tr>
			<td>u_id: ${user.u_id}</td>
			<td>username: ${user.username}</td>
			<td>email: ${user.email}</td>
			<td>password: ${user.password}</td>
			<td>authority: ${user.authority}</td>
			<td>balance: ${user.balance}</td>
			<td>img: ${user.image}</td>
		</tr>
	</c:forEach>
</table>

<h1><font color="green">BookInfo</font></h1>
<table width="200" border="1">
	<tr>
		<th>Book</th>
		<th>ISBN</th>
	</tr>
	<c:forEach var="book" items="${bookInfo.books}">
		<tr>
			<td>${book.isbn}</td>
			<td>${book.bookname}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>