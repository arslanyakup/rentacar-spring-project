function getUserBy() {
    var username=$('#username').val();

    $.ajax({
        url:'../getUserBy',
        type:'GET',
        ContentType:'json',
        data:{
            username:username
        },
        success:function (response) {
            if(response==false){
                $('#usererror').html("Bu Kullanıcı Adı başka kullanıcı tarafından kullanılıyor!!!");
            }
        }
    })
}