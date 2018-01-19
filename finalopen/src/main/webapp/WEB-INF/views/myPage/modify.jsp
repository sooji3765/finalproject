<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String r_num = request.getParameter("r_num");
	boolean result = false;
%>
<form>
	냉장고 id : <input type="text" value="rnum">
	<input type="submit" value="검색"/>
</form>