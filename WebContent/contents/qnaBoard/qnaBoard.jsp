<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../cinema/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" type="text/css" href="qnaBoard.css"/> 
    <link rel="stylesheet" type="text/css" href="default.css"/> 
    
	<script src="..//main/js/jquery-3.6.0.min.js"></script>
	<script src="..//main/js/lightslider.js"></script>
	
  
    <title>보드 초안</title>
    <style>
		.main-content{
			
			display:flex;
			margin:30px 0 0 30px;
		}
		
		
		.side{
			margin-left:70px;
		}
		
		
		
		.local-box{
			
			width:1000px;
			height:60px;
			display:flex;
			justify-content: flex-start;
			align-items: center;
			margin-left: 30px;
		}
		
		.local-box1{
			width:275px;
			height:60px;
			background-color: rgb(243, 156, 18);
			color:white;
			font-size:25px;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		
		.local-box2{
			font-size:18px;
			width:330px;
			height:60px;
			display: flex;
			justify-content: flex-start;
			align-items: flex-end;
			margin-left: 30px;
			
			
			
			
		}
		
		
		.local-box3{
			width:923px;
			display:flex;
			justify-content: flex-end;
			margin-top:100px;
			
		
		}
		
		.local-search{
			width:200px;
			height:34px;
			border:2px solid gray;
			margin-right: 10px;
		}
		
		.local-btn{
			float: left;
			margin-left: 2px;
			flex-direction:row;
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			border-color: black 1px solid;
			background-color: white;
			font-size: 15px;
			color: black;
			height: 40px;
			width: 55px;
			font-weight: 800;
		}
		
		#heading{
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			background: rgb(243, 156, 18);
			color:white;
			font-size:40px;
			font-weight: 1000;
			padding: 0.5rem 1rem;
		}
		#secondHeading{
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-size:20px;
			font-weight: 500;
			margin-left:10px;
		}
		
		#mainTable{
			
			align: center;
			text-align: center;
			border-top: 1px solid rgb(243, 156, 18);
			padding: 8px;
			font-size: 18px;
			border-collapse: collapse;
		}
		
		#mainTable th, #mainTable td{
			border: 1px solid rgb(243, 156, 18);
			text-align: center;
			padding: 8px;
		}
		
		.th1{
			width:50px;
		}
		.th2{
			width: 150px;
		}
		.th3{
			width:650px;
		}
		
		#writeNoBtn{
			color: white;
			font-size: 15px;
			background-color: rgb(243, 156, 18);
			font-family: "News Cycle", "Arial Narrow Bold", sans-serif;
			font-weight: 600;
			padding: 10px 45px;
			float: right;
			border:none;
			cursor:pointer;
		}
		
		#mainBottom{ margin-top: 20px; }
		
		#pagination{ margin-left: 270px;}
		
		#pagination a {
			display: block;
			color: black;
			float: left;
			font-size: 20px;
			padding: 8px 16px;
			text-decoration: none; 
			border: 1px solid rgb(243, 156, 18);
		}
		
		#pagination a.active {
		  background-color: rgb(243, 156, 18);
		  color: white;
		}
		
		#pagination a:hover:not(.active) {background-color: rgba(243, 156, 18, 0.5);}	
		
		
		
		#text{
			display:inline-block;
			text-align:center;
			width:50%;
			height:100px;
			margin-left: 90px;
			margin-top: 70px;
		}
    </style>
    
</head>

<body>
   		<%@include file="../common/loginbar.jsp" %>
		<main>
		<%@include file="../common/header.jsp" %>
    	
    	
    	
    
	    	<div class="local-box">
				<div class="local-box1">
					<span>고객센터</span>
				</div>
				<div class="local-box2">
					<span>1:1문의</span>
				</div>
			</div>
			<div class="local-box3">
					<div><input class="local-search" type="text"></div>
					<div><button class="local-btn">검색</button></div>
					
			</div>
			
		<div class="main-content">
		  <div class="main-tableBox">	
			<table id="mainTable">
				  <thead>
				    <tr>
				      <th scope="col" class="th1">순서</th>
				      <th scope="col" class="th2">답변여부</th>
				      <th scope="col" class="th3">제목</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr class="column1">
				      <td scope="row">1</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column2">
				      <td scope="row">2</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column3">
				      <td scope="row">3</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column4">
				      <td scope="row">4</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column5">
				      <td scope="row">5</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column6">
				      <td scope="row">6</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column7">
				      <td scope="row">7</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column8">
				      <td scope="row">8</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column9">
				      <td scope="row">9</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr class="column10">
				      <td scope="row">10</td>
				      <td></td>
				      <td></td>
			    	</tr>
				</tbody>
			</table>
			
			<div id="mainBottom">
				<div id="pagination">
					<ul>
						<li class="page-item disabled">
							<a class="page-link" href="#">«</a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">4</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">5</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">»</a>
						</li>
					</ul>
				</div>
					
				<a href="#a" class="open"><button type="button" id="writeNoBtn">문의하기</button></a>
			</div>
		</div>
	
			<div class="side">
			
				
			</div>	
	</div>
	
	<div class="popup">
		<h2>1:1문의</h2>
		<div class="con">
			<table class="type1">
			<caption>
				<details class="hide">
					<summary>1:1문의 폼</summary>
					<div>이름, 문의제목, 문의 내용 입력 표</div>
				</details>
			</caption>
			<colgroup>
			<col style="width: 111px">
			<col>
			</colgroup>
			<tbody>
			<tr>
				<th><label for="txt1">이름</label><span>*<em class="hide">필수입력</em></span></th>
				<td><input type="text" class="txt" id="txt1" placeholder="이름을 입력해 주세요."></td>
			</tr>
			<tr>
				<th><label for="txt2">문의 제목</label><span>*<em class="hide">필수입력</em></span></th>
				<td><input type="text" class="txt" id="txt2" placeholder="제목을 입력해주세요."></td>
			</tr>
			<tr>
				<th><label for="txt3">문의 내용</label><span>*<em class="hide">필수입력</em></span><br><em>(0/300 byte)</em></th>
				<td><textarea class="txt" id="txt3" placeholder="궁금하신 점이나 건의사항이 있다면 메모로 남겨 주세요. 예) 평일 오후 2시~3시 사이에 연락주세요."></textarea></td>
			</tr>

			</tbody>
			</table>
			<div class="agree">
				<input type="checkbox" id="chk1_4"><label for="chk1_4"><span>[필수]</span>개인정보 수집 및 이용 동의</label>
				<a href="#a" class="view">전문보기</a>
			</div>
		</div>
		<div class="txt_center">
			<a href="#a" class="btn_type1">문의 신청</a>
		</div>
		<a href="#a" class="close">닫기</a>
	</div>
	<div class="dim"></div>
		


    
    </main>
    
    
    
    
    <%@include file="../common/footer.jsp" %>
   	<script>
		$(document).ready(function(){
			
			$(".open").on('click',function(){
				$(".popup").show();
				$(".dim").show();
			});
			$(".popup .close").on('click',function(){
				$(this).parent().hide();
				$(".dim").hide();
			});
		});
	</script>

</body>
</html>