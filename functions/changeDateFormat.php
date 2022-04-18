<?php
function changeDateFormatToDB($date){
	$date = preg_replace('#(\d{2})/(\d{2})/(\d{4})#', '$3-$1-$2', $date);
	return $date;
}

function changeDateFormatFromDB($date){
	$date = preg_replace('#(\d{4})-(\d{2})-(\d{2})#', '$2/$3/$1', $date);
	return $date;
}
?>