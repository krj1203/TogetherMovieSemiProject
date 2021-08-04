# Together Moive!

## 개요 : 영화 및 극장  커뮤니티 사이트 

+ 현재 상영중인 영화 정보 및 개봉 예정작에 대한 정보를 사용자에게 제공하고 , 영화와 관련하여 사용자들이 자유롭게 의견을 나눌수 있는 공간을 제공 
+ 기존 영화 커뮤니티들과의 차별점으로는 본 사이트에서 영화 상영에 대한 정보를 실시간으로 제공하고 , 영화관 위치 및 테마 별 영화관 추천 . 현재 상영중인 영화 및 상영 예정작에 대한 영화 이미지를 제공.


## 사용기술 및 개발 환경

+ Front-end : <img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
+ Back-end : <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">   
+ Data-base : <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
+ Server : <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">  
+ Version-control: <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

## 구현 기능 

+ 회원가입 기능 구현 
+ 게시판 기능 구현 
+ 구글 지도 API 기능 구현 
+ 메일 인증 API 기능 구현 
+ 결제 API 기능 구현


## 핵심 특징
<img src ="https://user-images.githubusercontent.com/73329610/128127585-bd6851a6-33a6-4881-997e-e8b6ea37239a.png" width="50%" height="50%">

* 사이트의 메인페이지 
  * 최신 개봉작 및 상영 예정작에 대한 정보 제공  
  * 관리자가 오늘의 추천 영화를 선정함으로써 사용자에게 추천  
  

<img src ="https://user-images.githubusercontent.com/73329610/128128857-3bd94d1e-09f0-4744-84ac-2656944b5ec5.png" width="50%" height="50%">

* 박스오피스 , 최신 개봉작, 상영예정작을 구분하여 사용자에게 영회 정보 제공 


<img src ="https://user-images.githubusercontent.com/73329610/128127631-797ad6fa-1643-429a-8ba8-e1bc77a6cb84.png" width="50%" height="50%">

* 친구 , 커플 , 솔로가 갈만한 영화관 특징을 구분지어 영화관 정보 제공 
  

## 설계 주안점
+ 홈페이지 로그인 시 일반회원 , 관리자로 나누어 각각의 필요한 기능 및 페이지 구현 
+ Front-end view 단 구현 시 Include 와 jsp 및 csss 코드를 분리하여 코드 재활용 향상
+ 각 단위 기능 별로 책임자를 선정하여 기능 구현 
+ 깃 허브 이용시 팀장과 팀원들로 구분하여 각 역할에 맞는 업무 수행 
+ 에러 발생 시 원인 및 해결 방안을 팀장 및 팀원들에게 공유 


## 팀원별 단위 업무

임 종 부 (팀장) : 프로젝트 일정 관리 / 프로젝트 기술 가이드 / 깃허브 관리 / 프로젝트 Front-end 구현 / 맴버 기능구현 

전 상 수 : DB 생성 및 관리 / 영화 정보 게시판을 통해 영화 정볼르 제공하는 기능을 담당 및 구현

이 규 진 : 메인페이지 / 로그인 / 회원 가입 / 굿즈 / 구매 페이지 작성 / Goods 사진 게시판을 통해 상품등록 및 상품판매 기능 구현 
         
서 민 기 : 추천영화 , 오늘의 영화 CRUD 구현 / 게시판 소분류 목록 / 상세보기 /

윤 선 아 : 로그인바 , 헤더 및 footer 구현 / 기능 상 세분하여 각각의 파일에 인쿨르드할 수 있도록 수정 

김 신    :  회원 탈퇴 view 및 기능 단 구현 
