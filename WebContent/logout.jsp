<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
session.removeAttribute("username"); 
session.invalidate(); 
response.sendRedirect("login.jsp"); 
 
%> 