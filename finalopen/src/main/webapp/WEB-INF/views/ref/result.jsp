<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<h2> select result</h2>

<script>
function remove_this()
{
	//ajax 를 이용해서 DATABASE 에서 idx 해당하는 내용을 지우도록 요청한다.

	if (! confirm("삭제하시겠습니까?")) return;

	// 이 부분은 seobangnim.com 의 소스를 완전참조했습니다.
	// http://seobangnim.com/zbxe/?document_srl=15893

	var lo_this       = window.event.srcElement; // 이벤트가 발생한 객체가져 옴 여기선 버튼 이겠지?
	var lo_table      = lo_this.parentNode.parentNode.parentNode  //버튼으로 부터 위로 4번째 객체는 테이블이지 
	var li_row_index  = lo_this.parentNode.parentNode.rowIndex; // 버튼으로 부터 위로 2번째니깐 TR 이겠지 그 TR 의 INDEX 값
	lo_table.deleteRow(li_row_index); // 위에서 찾은 인덱스에 해당하는 TR 을 삭제하라...
}
</script>

<!-- 이제 이걸 표현언어로 바꾸고 여기에다가 필요한 값들을 입력하게함(용량 or 갯수) -->
<%
	String[] ingre = request.getParameterValues("ingre");
%>

<c:if test="${ingre==null}">
	<script>
		alert("선택한 항목이 없습니다");
		history.go(-1);
	</script>
</c:if>
<form id="ingreInsert" method="post" action="/ref/insertIngre.do">
<table name="list_ingre">
<c:forEach items="${ingre}" var="ingre" varStatus="status">
	<tr>
		<td>${ingre}
			<input type="hidden" id="ingre" name="ingre" value="${ingre}"/>
		</td>
		<td><input type="number" id="r_item_amount" name="r_item_amount"/>
			<select id="r_item_unit" name="r_item_unit">
				<option>개</option>
				<option>g</option>
				<option>kg</option>
				<option>mL</option>
				<option>L</option>
			</select>		
		</td>
		<td>보관 위치
			<select id = "r_item_space" name = "r_item_space">
				<option>냉장</option>
				<option>냉동</option>
				<option>상온</option>
			</select>
		</td>
		<td>
			<input type=button value="삭제" onclick="remove_this();">
		</td>
		
	</tr>
	
	
</c:forEach>
</table>
<input type="submit" value="내 냉장고에 저장"/>
</form>

