<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<button id="getBtn">요청하기</button>
<button id="getBtn2">요청하기 2</button>
<button id="getBtn3">요청하기 3</button>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	// id가 getBtn인 곳에 "click" 이벤트가 일어났을 때 호출되는 함수 등록
	$("#getBtn").on("click", function(){
		//jquery 의 기능을 이용해서 ajax 요청하기
		$.ajax({
			method:"GET",
			url:"${pageContext.request.contextPath}/ajax/getmsg.jsp",
			data:"num=1&name=kimgura",
			success:function(responseData){
				console.log(responseData);
			}
		});		
	});

		$("#getBtn2").on("click", function(){
			$.ajax({
				method:"get", //소문자로 작성해도된다. 
				url:"getmsg.jsp", // 상대 경로도 가능
				data:{num:2, name:"해골"}, // 요청 파라미터를 object 로 전달가능
				success:function(data){ //함수에 전달받는 변수명은 마음대로 작성가능
					// data 는 json 형식을 가지고 있는 string type 
					console.log(data);
					// javascript에서 사용하려면 object 로 바꿔서 사용해야 함
					var obj=JSON.parse(data);
					console.log(obj);
					// object로 바꿨기 때문에 쉽게 사용가능
					alert(obj.msg);
				}
			})
		});
		$("#getBtn3").on("click", function(){
			$.ajax({
				method:"get",
				url:"getgreet.jsp", // 요청 파라미터가 없으면 전달 안해도 된다.
				success:function(data){
					/*
						getgreet.jsp 페이지에서 contentType 을 application/json
						이라고 정확히 명시 했기 때문에 jquery 가 응답된 문자열을 
						object로 바꿔서 전달해준다.
					
					*/
					
					console.log(data);
				}
			});
		});
</script>
</body>
</html>