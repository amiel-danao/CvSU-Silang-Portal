<?php

class Cookie{
	/**
		@param $time Number of Days
	*/
	public static function put($name,$value,$time){
		setcookie($name, $value, time() + ($time*86400), "/"); //86400 = 1day;
	}
	public static function exists($name){
		return (isset($_COOKIE[$name]))?true:false;
	}
	public static function get($name){
		return (isset($_COOKIE[$name])?$_COOKIE[$name]:''); //returning value stored in that cookie name!!!
	}
	public static function modify($name,$value,$time){
		if(self::exists($name)){
			setcookie($name, $value, time() + ($time*86400), "/"); //86400 = 1day;
		}
	}
}
?>
