<%@page import="day03.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day03.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day3[4] - db 회원 리스트</title>
<style>
   h3 {
      text-align: center;
   }
   ul {
      display: flex;
      list-style: none;
      justify-content: space-between;
      padding-inlne-start: 0px;
   }
   ul #name {
      padding: 5px 20px;
      magin: 5px 0px;
      background-color: gray;
      color: white;
   }
   ul #email {width: 20vw}   /* vw는 화면크기를 100으로 하여 비율값 정합니다. */
   ul #hobby {width: 20vw}
   li {
      text-align: center;
      padding: 5px 20px;
      magin: 5px 0px;
      border: 1px solid gray;
      border-radius: 3px;
      width: 10vw;
   }
</style>
</head>
<body>
   <h3>고객리스트 WELCOME!!</h3>
   <ul>
      <li id="name">이름</li>
      <li>나이<%--(<%= (gender.equals("male") ? "남":"여") %>) --%></li>
      <li>성별</li>
      <li id="email">이메일</li>
      <li>주소</li>
      <li id="hobby">취미</li>
   </ul>
   <%
      CustomerDao dao = CustomerDao.getInstance();
      List<Customer> list = dao.selectAll();
      for (Customer cus : list) {
      //out.print(list);
   %>
   <ul>
      <li id="name"><%= cus.getName() %></li>
      <li id="email"><%= cus.getEmail() %></li>
      <li><%= cus.getAge() %> 세 (<%= (cus.getGender().equals("male") ? "남":"여") %>) </li>
      <li><%= cus.getGender() %></li>
      <li><%= cus.getAddr() %></li>
      <li id="hobby"><%= cus.getHobby() %></li>
   </ul>
   <%
      } 
   %>
</body>
</html>