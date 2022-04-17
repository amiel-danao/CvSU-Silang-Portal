<?php
function loggedIn(){
	if(Session::exists('loggedIn') && Session::get('loggedIn')==1){
		return TRUE;
	}
	else
		return FALSE;
}
?>