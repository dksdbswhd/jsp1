<%@page import="day03.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day06.dao.MybatisDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day06 - Mybatis 테스트 </title>
</head>
<body>
<%
	MybatisDao dao = MybatisDao.getInstance();
	List<Customer> list = dao.selectAll();
	out.print("<h4>select * from customer</h4>");
	out.print(list); 
	
	Customer cus = dao.select(99);
	out.print("<h4>select * from customer where idx=99</h4>");
	out.print(cus);
%>
</body>
</html>