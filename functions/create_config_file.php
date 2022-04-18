<?php

function create_config_file($db_server,$db_username,$db_password,$db_name,$ldap_server){
    
    $filename = "config_sample.php";
    $file = fopen($filename, "a+");
    $new_filename = "config.php";
    $nf = fopen($new_filename,"w");
    while(!feof($file)){
        $line = fgets($file);
        $var = array("db-server","db-username","db-password","db-name","ldap-server");
        $values = array($db_server,$db_username,$db_password,$db_name,$ldap_server);
        
        $content = str_replace($var, $values, $line);
        fwrite($nf,$content);
    }
}
?>