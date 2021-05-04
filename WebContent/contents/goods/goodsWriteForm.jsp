<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../cinema/css/style.css"/>
<style>

	.outer {
		width:1000px; height:650px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.insertArea {width:500px; height:450px; margin-left:auto; margin-right:auto;}
	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
	#titleImgArea {width:350px; height:200px; border:2px dashed darkgray; text-align:center; display:table-cell; vertical-align:middle;}
	#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		width:150px; height:100px; border:2px dashed darkgray;
		text-align:center; display:table-cell; vertical-align:middle;
	}
	#insertThumbTable{margin: auto;}

.pro{

	margin-top: 100px;
}

.img ul{
	padding: 0;
	list-style: none;
}
.product_view { position: relative;padding: 0 0 0 395px; width: 962px; box-sizing: border-box;}
.product_view .img { position: absolute; left: 0; top: 0;}
.product_view .img > img { width: 368px; height: 370px; border:1px solid #e8e8e8; }
.product_view .img li:after { content: ""; display: block; clear: both;}
.product_view .img li { float: left; padding: 10px 10px 0 0;}
.product_view .img li.on img { border-color:#0a56a9;}
.product_view .img li img { width: 68px; height: 68px; border:3px solid #e8e8e8;}
.product_view h2 { margin: 0 0 15px; padding: 0 0 20px; border-bottom:2px solid #333; font-size:24px; color:#232323; line-height: 26px;}
.product_view table th,
.product_view table td { padding:14px 0; font-size: 15px; color:#444; text-align: left;}
.product_view table td.price { font-size: 22px;}
.product_view table td.total { font-size:19px; color:#0a56a9;}
.product_view table td.total b { font-size: 22px;}
.product_view table .length input { width:45px; height: 30px; border: 1px solid black; text-align:center; }
.product_view table select { width:100%; border:1px solid #c6c6c6; box-sizing: border-box;  background: url("../images/ico_select.png") no-repeat right 11px center;appearance:none; -webkit-appearance:none; -moz-appearance:none;}
.product_view table select::-ms-expand { display: none;}
.product_view .btns { padding: 45px 0 0; text-align: center;}
.product_view .btns .btn1 { background: #666; color:white; width: 136px; height: 42px; border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px;}
.product_view .btns .btn2 { background: #0a56a9; color:white; width: 136px; height: 42px; border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px;}

</style>   
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
    
</head>

<body>

    <%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
			    	<!-- 상품 상세 정보 -->
			<form action="<%= request.getContextPath() %>/insert.gs" method="post" encType="multipart/form-data">
			<div class="pro">
				<div class="product_view">
					<table>
						<tr>
							<th width="100px">제목</th>
							<td colspan="3"><input type="text" size="15" name="title"></td>
						</tr>
						<tr>
							<th width="100px">가격</th>
							<td colspan="3"><input type="number" size="15" name="price"></td>
						</tr>
						<tr>
							<th width="100px">상품 설명</th>
							<td colspan="3"><textarea name="content" rows="5" cols="50" style="resize:none;"></textarea>
						</tr>
					<tr>
						<th>대표 이미지</th>
						<td colspan="3">
							<div id="titleImgArea">
								<img id="titleImg" width="350" height="200">
							</div>
						</td>
					</tr>
					<tr>
						<th>내용 사진</th>
						<td>
							<div id="contentImgArea1">
								<img id="contentImg1" width="120" height="100"> 
							</div>
						</td>
						<td>
							<div id="contentImgArea2">
								<img id="contentImg2" width="120" height="100"> 
							</div>
						</td>
						<td>
							<div id="contentImgArea3">
								<img id="contentImg3" width="120" height="100"> 
							</div>
						</td>
					</tr>
					</table>
					
					<div id="fileArea">
						<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
						<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
						<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
						<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
					</div>
					<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						$("#contentImgArea2").click(function(){
							$("#thumbnailImg3").click();
						});
						$("#contentImgArea3").click(function(){
							$("#thumbnailImg4").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								case 3: 
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
					<div class="btns">
						<input type="submit" class="btn1" id="insertBtn" value="작성완료">
						<input type="button" class="btn2" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.gs'" value="취소하기">
					</div>
				</div>
			</div>
			</form>
    </main>
</body>
</html>