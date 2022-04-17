<?php
require_once '../../core/init.php';
if(!loggedIn()){
    die();
}
if(Input::exists('get')){
    if(Input::get('sem')!=='' && Input::get('dep')!==''){
        $i=0;
        $c = new Course();
        $courses = $c->getCoursesAvailable(Input::get('sem'), Input::get('dep'));
        if(!empty($courses)){
            $i=1;
            $total_credit=0;
            $return = "";
            while($course = $courses->fetch_object()){
                $return .= "<option id='course_{$i}' value='{$course -> course_code}'>{$course -> course_name}</option>";
                

                //$return .= "<option value='$value'>$text</option>\n";
                $i++;
            }
            echo $return;
        }
    }
}
?>