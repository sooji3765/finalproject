<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>냉장고 재료 선택</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    
/*  ppit tab */
div.ppit-tab-container{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}
div.ppit-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.ppit-tab-menu div.list-group{
  margin-bottom: 0;
}
div.ppit-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.ppit-tab-menu div.list-group>a .glyphicon,
div.ppit-tab-menu div.list-group>a .fa {
  color: #8d6cab;
}
div.ppit-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.ppit-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.ppit-tab-menu div.list-group>a.active,
div.ppit-tab-menu div.list-group>a.active .glyphicon,
div.ppit-tab-menu div.list-group>a.active .fa{
  background-color: #8d6cab;
  background-image: #8d6cab;
  color: #ffffff;
}
div.ppit-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #8d6cab;
}

div.ppit-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.ppit-tab div.ppit-tab-content:not(.active){
  display: none;
}
    </style>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
    </script>
</head>
<body>
	<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-5 col-sm-8 col-xs-9 ppit-tab-container">
            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-3 ppit-tab-menu">
              <div class="list-group">
              <a href="#" class="list-group-item active text-center">
                  <h5 class="glyphicon glyphicon-home"></h5><br/>양념류
                </a>
                <a href="#" class="list-group-item text-center">
                  	곡류
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('account-summary-holder')">
          		        빵류
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('usage-holder')">
                  	유제품/치즈류
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('payment-holder')">
                	면/만두
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('search-holder')">
                  	감자/고구마
                </a>
                <a href="#" class="list-group-item text-center">
                  	햄/소시지
                </a>
                 <a href="#" class="list-group-item text-center">
                 	초콜렛/사탕
                </a>
                 <a href="#" class="list-group-item text-center">
                  	콩/견과류
                </a>
                <a href="#" class="list-group-item text-center">
                  	채소류
                </a>
                <a href="#" class="list-group-item text-center">
                  	버섯류
                </a>
                <a href="#" class="list-group-item text-center">
                  	과일류
                </a>
                <a href="#" class="list-group-item text-center">
                  	고기류
                </a>
                <a href="#" class="list-group-item text-center">
                  	어패류
                </a>
                <a href="#" class="list-group-item text-center">
                  	해초류
                </a>
                <a href="#" class="list-group-item text-center">
                  	계란류
                </a>
                
              </div>
            </div>
            <form id="ingreInput" name="ingreInput" method="post" action="/ref/result.do">
            <div class="col-lg-10 col-md-9 col-sm-9 col-xs-9 ppit-tab">
                <div class="ppit-tab-content active">
                    <center>
                      <p>
                          <tr>
								<td width="100" ><h3>양념류</h3></td>
								<td width="500"><c:forEach items="${ings1}" var="ings1" varStatus="status">
									<input type="checkbox" name="ingre" value="${ings1.ingredients_title}"/>
									${ings1.ingredients_title}
								</c:forEach></td>
							</tr>
                      </p>
                    </center>
                </div>
                
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings2}" var="ings2" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings2.ingredients_title}"/>
							${ings2.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
    
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          <c:forEach items="${ings3}" var="ings3" varStatus="status">
								<input type="checkbox" name="ingre" value="${ings3.ingredients_title}"/>
								${ings3.ingredients_title}
							</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                  		<c:forEach items="${ings4}" var="ings4" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings4.ingredients_title}"/>
							${ings4.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          <c:forEach items="${ings5}" var="ings5" varStatus="status">
								<input type="checkbox" name="ingre" value="${ings5.ingredients_title}"/>
								${ings5.ingredients_title}
							</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          <c:forEach items="${ings6}" var="ings6" varStatus="status">
								<input type="checkbox" name="ingre" value="${ings6.ingredients_title}"/>
								${ings6.ingredients_title}
							</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings7}" var="ings7" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings7.ingredients_title}"/>
							${ings7.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings8}" var="ings8" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings8.ingredients_title}"/>
							${ings8.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings9}" var="ings9" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings9.ingredients_title}"/>
							${ings9.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings10}" var="ings10" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings10.ingredients_title}"/>
							${ings10.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings11}" var="ings11" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings11.ingredients_title}"/>
							${ings11.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings12}" var="ings12" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings12.ingredients_title}"/>
							${ings12.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings13}" var="ings13" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings13.ingredients_title}"/>
							${ings13.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings14}" var="ings14" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings14.ingredients_title}"/>
							${ings14.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings15}" var="ings15" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings15.ingredients_title}"/>
							${ings15.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         <c:forEach items="${ings16}" var="ings16" varStatus="status">
							<input type="checkbox" name="ingre" value="${ings16.ingredients_title}"/>
							${ings16.ingredients_title}
						</c:forEach>
                      </p>
                    </center>
                </div>
            </div>
            <input type="submit" value="냉장고에 저장" id="submit"/>
            </form>

        </div>
        
  </div>
  
</div>
	<script type="text/javascript">
		$(document).ready(function() {
	    $("div.ppit-tab-menu>div.list-group>a").click(function(e) {
	        e.preventDefault();
	        $(this).siblings('a.active').removeClass("active");
	        $(this).addClass("active");
	        var index = $(this).index();
	        $("div.ppit-tab>div.ppit-tab-content").removeClass("active");
	        $("div.ppit-tab>div.ppit-tab-content").eq(index).addClass("active");
	    });
	});
	</script>
	<script>
	
	
	</script>
</body>
</html>




<!-- 

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
 -->