function loginCheck() {
	if (document.frm.userId.value.length == 0 || document.frm.userPassword.value == "") {
		alert("아이디 혹은 비밀번호를 입력해주세요");
		return false;
	}
	
	
	return true;
}
