function loginCheck() {
	if (document.frm.user_id.value.length == 0) {
		alert("아이디를 써주세요");
		frm.user_id.focus();
		return false;
	}
	if (document.frm.user_password.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.user_password.focus();
		return false;
	}
	return true;
}

function idCheck() {
	
	var popupX = (document.body.offsetWidth / 2) - (450 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (200 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	if (document.frm.user_id.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.frm.user_id.focus();
		return;
	}
	var url = "idCheck.do?user_id=" + document.frm.user_id.value;
	window.open(url,"_blank_1", 'status=no, height=200, width=450, left='+ popupX + ', top='+ popupY);
	
	
}

function nickNmaeCheck() {
	
	var popupX = (document.body.offsetWidth / 2) - (450 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (200 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	if (document.frm.user_nickName.value == "") {
		alert('닉네임을 입력하여 주십시오.');
		document.frm.user_nickName.focus();
		return;
	}
	var url = "nickNameCheck.do?user_nickName=" + document.frm.user_nickName.value;
	window.open(url,"_blank_1", 'status=no, height=200, width=450, left='+ popupX + ', top='+ popupY);
	
	
}

function idok(user_id) {
	opener.frm.user_id.value = document.frm.user_id.value;
	opener.frm.reid.value = document.frm.user_id.value;
	self.close();
}

function nickNameok(user_nickName) {
	opener.frm.user_nickName.value = document.frm.user_nickName.value;
	opener.frm.reid_nickName.value = document.frm.user_nickName.value;
	self.close();
}

function joinCheck() {

	if (document.frm.user_id.value.length == 0) {
		alert("아이디를 써주세요");
		frm.user_id.focus();
		return false;
	}
	
	if (document.frm.user_id.value.length < 4) {
		alert("아이디는 4글자이상이어야 합니다.");
		frm.user_id.focus();
		return false;
	}
	
	if (document.frm.reid.value.length == 0) {
		alert("아이디 중복 체크를 하지 않았습니다.");
		frm.user_id.focus();
		return false;
	}
	
	if (document.frm.user_nickName.value.length == 0) {
		alert("닉네임을 써주세요");
		frm.user_nickName.focus();
		return false;
	}
	
	if (document.frm.user_id.value.length < 2) {
		alert("닉네임은 2글자 이상이어야 합니다.");
		frm.user_nickName.focus();
		return false;
	}
	

	if (document.frm.reid_nickName.value.length == 0) {
		alert("닉네임 중복 체크를 하지 않았습니다.");
		frm.user_nickName.focus();
		return false;
	}
	
	if (document.frm.user_name.value.length == 0) {
		alert("이름을 써주세요.");
		frm.user_name.focus();
		return false;
	}

	
	if (document.frm.user_password.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.user_password.focus();
		return false;
	}
	if (document.frm.user_password.value != document.frm.user_passwordCheck.value) {
		alert("암호가 일치하지 않습니다.");
		frm.user_password.focus();
		return false;
	}
	
	
	
	
	if (document.frm.phone.value.length == 0) {
		alert("휴대폰 번호를 입력해주새요.");
		frm.user_phone.focus();
		return false;
	}
	
	
	
	
	if (document.frm.user_email.value.length == 0) {
		alert("이메일을 써주세요.");
		frm.user_email.focus();
		return false;
	}
	
	if (document.frm.address.value.length == 0) {
		alert("주소를 써주세요.");
		frm.address.focus();
		return false;
	}
	
	
	return true;
}