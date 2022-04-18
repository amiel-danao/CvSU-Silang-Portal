<?php
class OTP{
		private $_mobile,
				$_message,
				$_CODE; //more api options listing here
		public function __construct(){
				$this->_username='test';
				$this->_password='123';	// RedSMS.in password
				$this->_senderID='TESTIN'; // Sender ID !!
				/*
				**
				**	MORE API Inputs assign here
				**
				*/
			}
		public function getMobile(){
				return $this->_mobile;
			}
		public function send($mobile=8402059135){

				$this->generateOTP();
				$this->_mobile =$mobile ;
				$this->_message = 'Your One Time Password for MIS/SIS login is '.$this->_CODE;

				// API call to send sms
				$sms = new SMS();
				if($sms->send($this->_mobile, $this->_message)){
					return 1;
				}
				else{
					echo 'OTP problem please try again later!';
					Session::delete('OTPCode');
					die();
				}
			}

		private function generateOTP(){
				function generatePassword($length, $strength){
							$vowels = 'aeuy';
							$consonants = 'bdghjmnpqrstvz';
							if ($strength & 1)
							{
								$consonants .= 'BDGHJLMNPQRSTVWXZ';
							}
							if ($strength & 2)
							{
								$vowels .= "AEUY";
							}
							if ($strength & 4)
							{
								$consonants .= '23456789';
							}
							if ($strength & 8)
							{
								$consonants .= '@#$%';
							}
							$password = '';
							$alt = time() % 2;
							for ($i = 0; $i < $length; $i++)
							{
								if ($alt == 1)
								{
									$password .= $consonants[(rand() % strlen($consonants))];
									$alt = 0;
								}
								else
								{
									$password .= $vowels[(rand() % strlen($vowels))];
									$alt = 1;
								}
						}
						return $password;
					}
				$this->_CODE = generatePassword(8,4);
				Session::put('OTPCode', $this->_CODE);
			}
		public function verifyOTP($response){
				if(Session::exists('OTPCode') && $response===Session::get('OTPCode')){
						Session::delete('OTPCode');
						return 1;
					}
				else{
						return 0;
					}
			}
	}

?>

