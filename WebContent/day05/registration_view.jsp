<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[] - db 회원 등록</title>
<style>
   ul {
      list-style: none;
   }
   ul #name {
      padding: 5px 20px;
      magin: 5px;
      background-color: tomato;
      color: white;
   }
   li {
      padding: 5px 20px;
   }
</style>
</head>
<body>
   <h3>환영합니다! WELCOME!!</h3>
   <ul>
         <li id="name">${cus.name} 님</li>
         <li>${cus.age} 세 (${cus.gender eq 'male' ? '남성' : '여성'})</li>
         <li id="email">${cus.email}</li>
         <li>${cus.addr}</li>
         <li id="hobby">${cus.hobby}</li>
      </ul>
   <a href="update.jsp?idx=${cus.idx}">정보 수정</a>
</body>
</html>