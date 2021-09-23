<%@page import="day03.dto.Customer"%>
<%@page import="day03.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	CustomerDao dao = CustomerDao.getInstance();
	dao.deleteOK(idx);
	
	out.print("<script>");
	out.print("alert('고객idx " +idx+ " 삭제되었습니다.');");
	out.print("location.href='list.jsp';");
	out.print("</script>");

//	response.sendRedirect("list.jsp");
%>