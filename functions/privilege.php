<?php

function privilege(){
	if(Session::exists('privilege')){
		return Session::get('privilege');
	}
	else
		return NULL;
}
function privilegePriority(){
	switch(privilege()){
		case 'admin':
			return 0;
		case 'director':
		case 'dean':
			return 1;
		case 'hod':
			return 2;
		case 'dupc':
		case 'dppc':
			return 3;
		case 'teacher':
			return 4;
		case 'student':
			return 5;
	}
}
?>