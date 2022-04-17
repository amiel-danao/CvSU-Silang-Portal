$(document).ready(function(){
	$('#courses').multiselect({
		buttonWidth:'100%'
	});

    
    $('#department').change(function(){
        if($('#semester').val()!=='' && $('#department').val()!==''){
            $('#courses').load('students/ajax/semester_courses.php?sem='+$("#semester").val()+'&dep='+$("#department").val(),
			function(responseTxt, statusTxt, xhr){
				if(statusTxt == "success")
				{
					console.log(responseTxt);

					$('#courses').multiselect('rebuild');

				}
				if(statusTxt == "error")
				  alert("Error: " + xhr.status + ": " + xhr.statusText);
			});
        }
    });
    
    $('#semester').change(function(){
        if($('#semester').val()!=='' && $('#department').val()!==''){
            $('#courses').load('ajax/semester_courses.php?sem='+$("#semester").val()+'&dep='+$("#department").val()+'&token='+$('#token').val());
        }
    });
    

});