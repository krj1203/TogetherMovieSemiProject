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
		width:1100px; height:650px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.insertArea {width:350px; height:310px; margin-left:auto; margin-right:auto;}
	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
	#titleImgArea {width:300px; height:200px; border:2px dashed darkgray; text-align:center; display:table-cell; vertical-align:middle;}
	#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		width:150px; height:100px; border:2px dashed darkgray;
		text-align:center; display:table-cell; vertical-align:middle;
	}
	#insertThumbTable{margin: auto;}

.movieInfo{

	margin-top: 100px;
}

.img ul{
	padding: 0;
	list-style: none;
}
.movieInfo_view { position: relative;padding: 0 0 0 395px; width: 962px; box-sizing: border-box;}
.movieInfo_view .img { position: absolute; left: 0; top: 0;}
.movieInfo_view .img > img { width: 368px; height: 370px; border:1px solid #e8e8e8; }
.movieInfo_view .img li:after { content: ""; display: block; clear: both;}
.movieInfo_view .img li { float: left; padding: 10px 10px 0 0;}
.movieInfo_view .img li.on img { border-color:#0a56a9;}
.movieInfo_view .img li img { width: 68px; height: 68px; border:3px solid #e8e8e8;}
.movieInfo_view h2 { margin: 0 0 15px; padding: 0 0 20px; border-bottom:2px solid #333; font-size:24px; color:#232323; line-height: 26px;}
.movieInfo_view table th,
.movieInfo_view table td { padding:14px 0; font-size: 15px; color:#444; text-align: left;}
.movieInfo_view table td.price { font-size: 22px;}
.movieInfo_view table td.total { font-size:19px; color:#0a56a9;}
.movieInfo_view table td.total b { font-size: 22px;}
.movieInfo_view table .length input { width:45px; height: 30px; border: 1px solid black; text-align:center; }
.movieInfo_view table select { width:100%; border:1px solid #c6c6c6; box-sizing: border-box;  background: url("../images/ico_select.png") no-repeat right 11px center;appearance:none; -webkit-appearance:none; -moz-appearance:none;}
.movieInfo_view table select::-ms-expand { display: none;}
.movieInfo_view .btns { padding: 45px 0 0; text-align: center;}
.movieInfo_view.btns .btn1 { background: #666; color:white; width: 136px; height: 42px; border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px;}
.movieInfo_view.btns .btn2 { background: #0a56a9; color:white; width: 136px; height: 42px; border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px;}

</style> 
    
    
    
	<script src="contents/main/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/contents/main/css/index.css"/>
	
    
</head>

<body>

    <%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
			    
			<form action="<%= request.getContextPath() %>/BMovieInsert" method="post" encType="multipart/form-data">
			<div class="movieInfo">
				<div class="movieInfo_view">
					<table>
					<tr>
						<th>대표 이미지</th>
						<td colspan="3">
							<div id="titleImgArea">
								<img id="titleImg" width="350" height="200">
							</div>
						</td>
					</tr>
						<tr>
							<th width="100px">제목</th>
							<td colspan="3"><input type="text" size="15" name="title"></td>
						</tr>
						<tr>
							<th width="100px">개봉일</th>
							<td colspan="3"><input type="text" size="15" name="date"></td>
						</tr>
						<tr>
							<th width="100px">감독</th>
							<td colspan="10"><input type="text" size="15" name="director"></td>
						</tr>
						<tr>
							<th width="100px">출연진</th>
							<td colspan="10"><input type="text" size="15" name="actor"></td>
						</tr>
						<tr>
							<th width="100px">장르</th>
							<td colspan="3"><input type="text" size="15" name="genre"></td>
						</tr>
						<tr>
							<th width="100px">상영시간</th>
							<td colspan="3"><input type="text" size="15" name="runningTime"></td>
						</tr>
						<tr>
							<th width="100px">관람등급</th>
							<td colspan="3"><input type="text" size="15" name="age"></td>
						</tr>
						<tr>
							<th width="100px">줄거리</th>
							<td colspan="3"><textarea name="content" rows="30" cols="60" style="resize:none;"></textarea>
						</tr>
					<tr>
						<th>스틸컷</th>
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
						<input type="button" class="btn2" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/listBMovie'" value="취소하기">
					</div>
				</div>
			</div>
			</form>
    </main>
</body>
</html>