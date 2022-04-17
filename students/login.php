<?php
require_once '../core/init.php';
if (loggedIn()) {
    Redirect::to('home.php');
    exit();
}
if (Input::exists()) {
    if (Input::get('login') != '') {
        $validate   = new Validate();
        $validation = $validate->check($_POST, array(
            'a' => array(
                'required' => true
            ),
            'b' => array(
                'required' => true
            )
        ));
        if ($validate->passed()) {
                if (validateEmail(Input::get('a'))) {
                    $email = Input::get('a');
                    $ldap  = new LDAP();
                    if ($ldap->Auth(Input::get('a'), Input::get('b')) && Token::check(Input::get('token'))) { // verify using LDAP and check token!!
                        if (Session::get('type') === 'faculty') { //check who logged in, differentiating between student and faculty members' login!
                            //case for teacher's or other staff's login
                            $validate->addError("Please <a href='http://mis.nits.ac.in'>CLICK HERE</a> for faculty login area.");
                            Session::destroy();
                        } else if (Session::get('type') === 'student') {
                            // case for students' login!!
                            $student = new Student();
                            $v       = $student->validateLogin();
                            if ($v == 1) {
                                $cookiename = 'sisnootp' . $student->getMobile();
                                if (1) { //Cookie::get($cookiename)
                                    Session::put('loggedIn', 1);
                                    $log = new Log();
                                    $log->loginLog('success');
                                    Redirect::to('home.php');
                                } else {
                                    $otp = new OTP();
                                    if ($otp->send($student->getMobile())) { //$otp->send($student->getMobile()) //Send OTP
                                        Session::put('OTP Sending', 'OTP Sent, Verify Here');
                                    }
                                }
                                unset($cookiename);
                            } else if ($v == 0 || $v == 4) {
                                //Student is logging in for the first time in this semester.
                                //Show him his form to fill up his details
                                Session::put('loggedIn', 1);
                                $user = Input::get('a');
                                if ($user[0] >= 0 && $user[0] <= 9) {
                                    $email = $ldap->getDEmail($email);
                                }
                                Session::put('student_email', $email);
                                Redirect::to('registration.php?step=1');
                            } else if ($v == 3) {
                                $validate->addError('This account is currently blocked because of multiple failed login attempts.');
                            } else if ($v == 2) {
                                $validate->addError('Your registration process is complete. Please wait/ask for approval from any authority.');
                            } else if ($v == 5) {
                                /* if payment option online
                                Session::put('loggedIn', 1);
                                Session::put('student_email', Input::get('a'));
                                Redirect::to('registration.php?step=3');
                                */
                                $validate->addError('Your registration process is complete. Please wait/ask for approval from any authority.');
                            }
                        }
                    } else {
                        // Not valid login
                        Session::destroy();
                        $validate->addError('Wrong Username or Password');
                    }
                } else {
                    $email = Input::get('a') . '@student.nits.ac.in';
                    $ldap  = new LDAP();
                    if ($ldap->Auth($email, Input::get('b')) && Token::check(Input::get('token'))) { // verify using LDAP and check token!!
                        if (Session::get('type') === 'faculty') { //check who logged in, differentiating between student and faculty members' login!
                            //case for teacher's or other staff's login
                            $validate->addError("Please <a href='http://mis.nits.ac.in'>CLICK HERE</a> for faculty login area.");
                            Session::destroy();
                        } else if (Session::get('type') === 'student') {
                            // case for students' login!!
                            $student = new Student();
                            $v       = $student->validateLogin();
                            if ($v == 1) {
                                $cookiename = 'sisnootp' . $student->getMobile();
                                if (1) { //Cookie::get($cookiename)
                                    Session::put('loggedIn', 1);
                                    $log = new Log();
                                    $log->loginLog('success');
                                    Redirect::to('home.php');
                                } else {
                                    $otp = new OTP();
                                    if ($otp->send($student->getMobile())) { //$otp->send($student->getMobile()) //Send OTP
                                        Session::put('OTP Sending', 'OTP Sent, Verify Here');
                                    }
                                }
                                unset($cookiename);
                            } else if ($v == 0 || $v == 4) {
                                //Student is logging in for the first time in this semester.
                                //Show him his form to fill up his details
                                Session::put('loggedIn', 1);
                                $user = Input::get('a');
                                if ($user[0] >= 0 && $user[0] <= 9) {
                                    $email = $ldap->getDEmail($email);
                                }
                                Session::put('student_email', $email);
                                
                                Redirect::to('registration.php?step=1');
                            } else if ($v == 3) {
                                $validate->addError('This account is currently blocked because of multiple failed login attempts.');
                            } else if ($v == 2) {
                                $validate->addError('Your registration process is complete. Please wait/ask for approval from any authority.');
                            } else if ($v == 5) {
                                /* if payment option online
                                Session::put('loggedIn', 1);
                                Session::put('student_email', Input::get('a'));
                                Redirect::to('registration.php?step=3');
                                */
                                $validate->addError('Your registration process is complete. Please wait/ask for approval from any authority.');
                            }
                        }
                    } else {
                        // Not valid login
                        Session::destroy();
                        $validate->addError('Wrong Username or Password');
                    }
                }
        }
        
    }
    if (Input::get('otpsubmit') != '') {
        $otp_validate   = new Validate();
        $otp_validation = $otp_validate->check($_POST, array(
            'OTP' => array(
                'required' => true,
                'min' => 8,
                'max' => 8
            )
        ));
        if ($otp_validate->passed() && Token::check(Input::get('token'))) {
            $otp = new OTP();
            if ($otp->verifyOTP(Input::get('OTP'))) { //$otp->verifyOTP(Input::get('OTP'))
                Session::deleteloginAttempt('OTP');
                Session::put('loggedIn', 1);
                $log = new Log();
                $log->loginLog('success');
                if (Input::get('nootp') == 1) {
                    $cookiename = 'sisnootp' . Session::get('mobile');
                    Cookie::put($cookiename, true, 15);
                    unset($cookiename);
                }
                Redirect::to('home.php');
            } else {
                $log = new Log();
                $log->loginLog('wrong OTP');
                Session::put('OTP Sending', 'Incorrect, Enter Again');
                Session::loginAttempt('OTP');
                if (Session::loginAttempts('OTP') == 3) {
                    // blocking the user for further login!!
                    // check whether ADMIN or any other Email-based user was trying to login
                    if (Session::exists('student_id')) {
                        $student = new Student();
                        if ($student->block(Session::get('student_id'))) {
                            Session::destroy();
                            Redirect::to('includes/errors/blocked.php');
                        }
                    }
                }
            }
        } else {
            Session::put('OTP Sending', '');
        }
    }
}
?>

<!DOCTYPE html>
<!--
Name: National Institute of Technology, Silchar. Management Information System | Login Page


AUTHOR
Design and code by: Harsh Vardhan Ladha & Yogesh Chauhan


CREDITS
Ripon Patgiri

SUPPORT
E-mail: harsh.ladha@gmail.com , anujsingh432@gmail.com , ripon.patgiri@gmail.com

-->
<html>
<head>
  <link rel="icon" href="images/logo.png">
  <link rel="shortcut icon" href="images/logo.png" />
    <title>CSVU Portal - Student</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--Login CSS -->
    <link href="css/login.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <!--  Google Recaptcha api -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
    <!--Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Balthazar&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

    <!--Font Awesome-->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <div class="mis login-form">
        <div class="col-sm-6 col-md-5 col-lg-4 col-sm-offset-6 text-center login-popup-wrap">
          <?php
            if(isset($validate)){
                     foreach ($validate->errors() as $errors) {
                          switch($errors) {
                             case 'a is required' :
                echo '<div class="alert alert-warning alert-dismissible" role="alert">';
                echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                                echo 'Please enter your email';
                echo '</div>';
                             break;
                             case 'b is required' :
                                echo '<div class="alert alert-warning alert-dismissible" role="alert">';
                echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                                echo 'Password field cannot be left blank';
                echo '</div>';
                             break;
                             case 'g-recaptcha-response is required' :
                                echo '<div class="alert alert-warning alert-dismissible" role="alert">';
                echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                                echo 'Please verify you\'re not a robot';
                echo '</div>';
                             break;
                             default :
                               echo '<div class="alert alert-danger alert-dismissible" role="alert">';
                echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                                echo $errors;
                echo '</div>';
                             break;
                           }
                       }
          unset($validate);
        }
      if (isset($otp_validate)) {
                foreach ($otp_validate->errors() as $errors) {
                   echo '<div class="alert alert-warning alert-dismissible" role="alert">';
          echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                    echo $errors;
          echo '</div>';
        }
        unset($otp_validate);
             }
      if(Session::exists('OTP Sending') && Session::get('OTP Sending')!='Incorrect, Enter Again' && Session::get('OTP Sending')!=''){
        echo '<div class="alert alert-success alert-dismissible" role="alert">';
        echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                echo Session::get('OTP Sending');
        echo '</div>';
      }
      if(Session::exists('OTP Sending') && Session::get('OTP Sending')=='Incorrect, Enter Again'){
        echo '<div class="alert alert-danger alert-dismissible" role="alert">';
        echo '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                echo Session::get('OTP Sending');
        echo '</div>';
      }
      if(!Session::exists('OTP Sending') && !Session::exists('OTPCode')){

      ?>
            <div class="login-popup">
              <div id="logo"> </div>
                <h1 class="title"><strong>CSVU Portal - Student</strong></h1>
                <form role="form" method="post" action="login.php">
                    <div class="form-group input-group">
            <span rel="tooltip" data-original-title="Scholar Number : e.g., 12-1-5-001" class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input rel="tooltip" data-original-title="Scholar Number : e.g, 12-1-5-001 " type="text" class="form-control text-center text" id="" placeholder="Scholar Number" value="<?php echo Input::get('a'); ?>" name="a">
                    </div>
                    <div class="form-group input-group">
            <span rel="tooltip" data-original-title="Password" class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                        <input rel="tooltip" data-original-title="Password" type="password" class="form-control text-center text" id="" placeholder="Password" name="b">
                    </div>
                    <div class="form-group">
                      <input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
      <a href="forget.php">Forget Password?</a>
                        <input type="submit" class="btn btn-default submit" value="Sign In" name="login">
                    </div>
                </form>
            </div>
            <?php
              }
        else if(Session::exists('OTP Sending') || Session::exists('OTPCode')){
          Session::delete('OTP Sending');
      ?>
            <div class="login-popup">
                <h1 class="title"><strong>One Time Password</strong></h1>
                <form role="form" method="post" action="login.php">
                    <div class="form-group input-group">
            <span rel="tooltip" data-original-title="One Time Password" class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input autofocus rel="tooltip" data-original-title="Enter OTP which is sent to your mobile phone" type="text" class="form-control text-center text" name="OTP" placeholder="OTP(One Time Password)" class="rect" maxlength="8" autocomplete="off" />
                    </div>
		    <div class="form-group input-group">
			<input type="checkbox" name="nootp" value="1" id='nootp' checked ><label for='nootp'>Don't ask for OTP again on this computer</label>
		    </div>
                    <div class="form-group">
                      <input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
                        <input type="submit" class="btn btn-default submit" value="Verify" name="otpsubmit"><br/><br/>
                        <a href="logout.php"><input type="button" class="btn btn-danger cancel" value="Cancel"></a>
                    </div>
                </form>
            </div>
            <?php
        }
      ?>

        </div>
    </div>

    <script type="text/javascript" src="js/jquery.min.js"></script>

  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script>
      $('[rel=tooltip]').tooltip();
    </script>

    <script type="text/javascript">
             var _gaq = _gaq || [];
                      _gaq.push(['_setAccount', 'UA-58077290-1']);
                      _gaq.push(['_trackPageview']);
                      (function() {
                        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                        ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                      })();
                    </script>
</body>
</html>

