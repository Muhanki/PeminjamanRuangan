<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Hapus session
    session.invalidate();
    // Redirect ke login
    response.sendRedirect("login.jsp");
%>