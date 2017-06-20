function checkPasswordMatch() {
	var password = $('#password').val();
	var newpassword = $('#newpassword').val();
	var checkpassword = $('#confirmpassword').val();
	var userid = $('#userid').val();
	var json = {
		'id' : userid,
		'password' : newpassword
	};
	var post_data=JSON.stringify(json);
	$
			.ajax({
				url : 'passwordconfirm',
				type : 'GET',
				contentType : 'json',
				data : {
					userid : userid
				},
				success : function(response) {
					if (response != password) {
						$('#oldpasswordconfirm').html("Parola yanlış, yeniden deneyiniz!!");
					}
					else {
					}
						if (newpassword != checkpassword) {
							$('#divCheckPasswordMatch')
									.html(
											"Parolalar uyuşmuyor. Lütfen yeniden deneyiniz!!!");
						} else {
							$.ajax({
								url : "changepassword",
								type : "POST",
								contentType : "application/json;charset=UTF-8",
								data : post_data,
								success:function(response){
									alert("Parola başarı ile değiştirildi!!");
									window.location.replace(response);
								}
							})
						}
				}
			})

}


$(document).ready(function(){
	var uzunluk = $("html").height();
});