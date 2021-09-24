<%@page import="day05.dao.MybatisDao"%>
<%@page import="day03.dao.CustomerDao"%>
<%@page import="day03.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
      // 서버에서 데이터 처리를 위한 자바코드
      request.setCharacterEncoding("UTF-8");
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      int age = Integer.parseInt(request.getParameter("age"));   // Vo 객체에 저장할 때 필요합니다.
      String addr = request.getParameter("addr");
      if(addr.equals("기타")) addr = request.getParameter("addr_etc");
      String gender = request.getParameter("gender");
      String hobbies = Arrays.toString(request.getParameterValues("hobby"));
      String[] hobby = request.getParameterValues("hobby");
      hobbies = hobbies.substring(1, hobbies.length()-1);
      String password = request.getParameter("password");
      
      Customer cus = new Customer(0, name, password, email, addr, gender, age, hobbies);
      MybatisDao dao = MybatisDao.getInstance();
      
      int idx = dao.insert(cus); cus.setIdx(idx);
      
      request.setAttribute("cus", cus);   // 여기서 cus 객체는 
      pageContext.forward("registration_view.jsp");
   %>