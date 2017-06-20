var username=$("#username").val();
$.ajax({
    url:'../../../../car/approvalUser',
    type:'GET',
    ContentType:'json',
    data:{
        username:username
    },
    success: function(response){
        if(response!=0){
            $('#span1').html(response);
            $('#span2').html(response);
        }
        else if(response==0){
            $('#span1').hide();
            $('#span2').hide();
        }
    }
})