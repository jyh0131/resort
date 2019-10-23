function checkInputEmpty($objs){
	var count = 0;
	$objs.each(function(i,obj){
		if($(obj).val() == ""){
			$(obj).next().css("display","inline");
			count++;
		}else{
			$(obj).next().css("display","none");
		}
	})
	
	if(count > 0){//에러가 있으면 전송을 막음
		return false;
	}
	return true;//error가 없다(input 태그 중에 빈 태그가 없다)
}