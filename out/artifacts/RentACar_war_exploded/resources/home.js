function getCompareDate(){
    var dateend=$('#dateend').val();
	var datest=$('#datest').val();
	console.log("DateStart: "+datest);
	console.log("DateEnd: "+dateend);
	var json = {
		'dateend' : dateend,
		'datest' : datest
		};
	var data=JSON.stringify(json);
	$.ajax({
		url:'compareDate',
		type:'POST',
		contentType:'application/json; charset=UTF-8',
		data: data,
		success:function(response){
			if (response==false){
                $('#starterror').html("İade Tarihinden sonra olamaz!");
                $('#enderror').html("Alış tarihinden önce olamaz!");
            }
			console.log(response);
		}
	})
}