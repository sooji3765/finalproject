<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


    <h2>내 냉장고에 넣을 재료 고르기</h2>
    
    <table>
    	
    	<tr>
			<td width="100" ><h3>양념류</h3></td>
			<td width="500"><c:forEach items="${ings1}" var="ings1" varStatus="status">
				<input type="checkbox" name="ingre" value="${ings1.ingredients_title}"/>
				${ings1.ingredients_title}
			</c:forEach></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button"  value="다음"/>
			</td>
		</tr>
		
	</table>

	<h3>곡류</h3>	
		<c:forEach items="${ings2}" var="ings2" varStatus="status">
			<input type="checkbox" value="${ings2.ingredients_title}"/>
			${ings2.ingredients_title}
		</c:forEach>
	
	<h3>빵류</h3>	
		<c:forEach items="${ings3}" var="ings3" varStatus="status">
			<input type="checkbox" value="${ings3.ingredients_title}"/>
			${ings3.ingredients_title}
		</c:forEach>
		
	<h3>유제품/치즈류</h3>
		<c:forEach items="${ings4}" var="ings4" varStatus="status">
			<input type="checkbox" value="${ings4.ingredients_title}"/>
			${ings4.ingredients_title}
		</c:forEach>
			
	<h3>면/만두</h3>	
		<c:forEach items="${ings5}" var="ings5" varStatus="status">
			<input type="checkbox" value="${ings5.ingredients_title}"/>
			${ings5.ingredients_title}
		</c:forEach>
		
	<h3>감자/고구마류</h3>
		<c:forEach items="${ings6}" var="ings6" varStatus="status">
			<input type="checkbox" value="${ings6.ingredients_title}"/>
			${ings6.ingredients_title}
		</c:forEach>
			
	<h3>햄/소시지</h3>	
		<c:forEach items="${ings7}" var="ings7" varStatus="status">
			<input type="checkbox" value="${ings7.ingredients_title}"/>
			${ings7.ingredients_title}
		</c:forEach>	
		
	<h3>초콜렛/사탕</h3>	
		<c:forEach items="${ings8}" var="ings8" varStatus="status">
			<input type="checkbox" value="${ings8.ingredients_title}"/>
			${ings8.ingredients_title}
		</c:forEach>	
		
	<h3>콩/견과류</h3>	
		<c:forEach items="${ings9}" var="ings9" varStatus="status">
			<input type="checkbox" value="${ings9.ingredients_title}"/>
			${ings9.ingredients_title}
		</c:forEach>
			
	<h3>채소류</h3>	
		<c:forEach items="${ings10}" var="ings10" varStatus="status">
			<input type="checkbox" value="${ings10.ingredients_title}"/>
			${ings10.ingredients_title}
		</c:forEach>
			
	<h3>버섯류</h3>	
		<c:forEach items="${ings11}" var="ings11" varStatus="status">
			<input type="checkbox" value="${ings11.ingredients_title}"/>
			${ings11.ingredients_title}
		</c:forEach>
			
	<h3>과일류</h3>	
		<c:forEach items="${ings12}" var="ings12" varStatus="status">
			<input type="checkbox" value="${ings12.ingredients_title}"/>
			${ings12.ingredients_title}
		</c:forEach>
			
	<h3>고기류</h3>	
		<c:forEach items="${ings13}" var="ings13" varStatus="status">
			<input type="checkbox" value="${ings13.ingredients_title}"/>
			${ings13.ingredients_title}
		</c:forEach>
			
	<h3>어패류</h3>	
		<c:forEach items="${ings14}" var="ings14" varStatus="status">
			<input type="checkbox" value="${ings14.ingredients_title}"/>
			${ings14.ingredients_title}
		</c:forEach>
			
	<h3>해초류</h3>	
		<c:forEach items="${ings15}" var="ings15" varStatus="status">
			<input type="checkbox" value="${ings15.ingredients_title}"/>
			${ings15.ingredients_title}
		</c:forEach>	
		
	<h3>계란류</h3>	
		<c:forEach items="${ings16}" var="ings16" varStatus="status">
			<input type="checkbox" value="${ings16.ingredients_title}"/>
			${ings16.ingredients_title}
		</c:forEach>	
