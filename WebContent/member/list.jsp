<%@page import="day03.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day03.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
      CustomerDao dao = CustomerDao.getInstance();
      List<Customer> list = dao.selectAll();
      request.setAttribute("list", list);
      pageContext.forward("list_view.jsp");
   %>
