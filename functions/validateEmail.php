<?php
function validateEmail($string){
		$regex = '/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i';
	
		if($string == '') { 
			return false;
		} else {
			$check = preg_replace($regex, '', $string);
		}
	
		return empty($check) ? true : false;
	}
?>