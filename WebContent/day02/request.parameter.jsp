<%@page import="day01.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[4]</title>
</head>
<body>
<!-- request parameter : request 객체에 저장되어 서버에게 전달되는 데이터. 
	 1) URL뒤에 ?name=홍길동&age=34(쿼리 문자열)로 전달하는 방법
	 2) method 를 post 로 하여 전달하는 방법 -->
<!-- 요청 URL : http://localhost:8082/jsp1/day02/request.parameter.jsp?name=홍길동&age=34 
								 ㄴ  ★★Request Method : GET -->
<h3>Request Parameter 연습 </h3>
<!-- 이 JSP 파일의 역할 : 사용자가 보낸 데이터를 받아서 처리합니다. -->
<hr>
<%
	//form date(method post)로 전달된 데이터의 인코딩 필요합니다.
	request.setCharacterEncoding("UTF-8");


	//request 의 파라미터 가져오기 입니다. 파라미터가 10개 라면... getparameter() 메소드는 몇번? 10번
			// 예고편 : DTO(VO) 타입 클래스를 이용해서 파라미터와 객체를 자동으로 매핑(프레임워크)
	String name = request.getParameter("name");		//"name" 은 ?뒤에 파라미터이름
	String age = request.getParameter("age");		//파라미터 안받았다고 오류가 발생하지 않는다.
	String location = request.getParameter("location");		//파라미터 이름 "location" 의 값이 없다면 null
	
%>
<ul>
	<li>이름 : <%= name%></li>
	<li>나이 : <%= age%></li>
<!-- 파라미터에 location 도 전달해봅시다. -->
	<li>지역 : <%= location%></li>
</ul>
<!-- 파라미터값으로 MyUser 객체를 생성해 봅시다. -->
<%
//	if (age==null) age="999";

	if(age==null){
		//브라우저에 태그를 print 하라는것은 → 응답할 HTML 형식 문서에 태그가 추가되는 것
		out.print("<script>");
	    out.print("alert('나이를 반드시 입력해야합니다.')");
	    out.print("</script>");
	}else {
		MyUser my2 = new MyUser(name, Integer.parseInt(age), location);
							//Integer.parseInt(agt) → age가 null이면 오류
		out.print(my2);		//out 은 내장객체 → 브라우저에 출력
%>

<ul>
	<li>이름 : <%= my2.getName()%></li>
	<li>나이 : <%= my2.getAge()%></li>
	<li>지역 : <%= my2.getLocation()%></li>
</ul>
<%
	} //if end
%>


</body>
</html>