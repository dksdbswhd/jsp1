<%@page import="java.util.List"%>
<%@page import="day03.dao.CustomerDao"%>
<%@page import="day03.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[4]- db 회원 리스트</title>
<style>
	ul{
		display:flex;
		list-style: none;
		justify-content: space-between;
		padding-inline-start:0px;  /* 목록 들여쓰기 없애기 */
	}
	ul #name{
		padding : 5px  20px;
		margin : 5px 0px;
		background-color: tomato;
		color:white;
	}
	ul #email { width : 20vw}  /* vw는 화면크기를 100으로 하여 비율값 정합니다.*/
	ul #hobby { width : 20vw}
	li {
		padding : 5px  20px;
		margin : 5px 0px;
		border: 1px solid gray;
		border-radius: 3px;
		width: 10vw;
	}
	</style>
</head>
<body>
<!-- 실행 url은 list.jsp 로 한다. -->
<h3> 고객 리스트 WELCOME!!!</h3>
<%
	List<Customer> list = (List<Customer>)request.getAttribute("list");  //다음주에는 이 코드를 없앱니다.
	for(Customer cus : list) {
%>
<ul>
	<li id="name"><a href="update.jsp?idx=<%=cus.getIdx()%>">
				<%= cus.getName() %></a> 님</li>
	<li id="email"><%= cus.getEmail() %></li>
	<li><%= cus.getAge() %> 세 (<%= (cus.getGender().equals("male")? "남":"여") %>) </li>
	<li><%= cus.getAddr() %></li>
	<li id="hobby"><%= cus.getHobby() %></li>
</ul>
<%
	}
%>
</body>
</html>
