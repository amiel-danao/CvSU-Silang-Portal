<?php
require_once 'core/init.php';
if(!loggedIn()){
	die();
	exit();
}
?>
				<section class="content-header">
                    <h1>
                        Students
                        <small>Add new student</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="home.php"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Students</a></li>
                        <li class="active">Add new student</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                	<div class="col-md-6">
                	
                	<div id="update">
						
					</div>
								<div class="box box-default">
	                                <div class="box-header">
	                                    <h3 class="box-title">Add New Student</h3>
	                                </div><!-- /.box-header -->
	                                <!-- form start -->
	                                <form role="form" id="add_new_student">
	                                    <div class="box-body">
	                                        <div class="form-group">
	                                            <label for="studentFirstName">First name of Student</label>
	                                            <input type="text" class="form-control" id="studentFirstName" placeholder="First name of student" name="firstname" required>
	                                        </div>
                                            <div class="form-group">
	                                            <label for="studentLastName">Last name of Student</label>
	                                            <input type="text" class="form-control" id="studentLastName" placeholder="Last name of student" name="lastname" required>
	                                        </div>
                                            <div class="form-group">
	                                            <label for="studentMiddleName">Middle name of Student</label>
	                                            <input type="text" class="form-control" id="studentMiddleName" placeholder="Middle name of student" name="middlename">
	                                        </div>
                                            <div class="form-group">
                                                <label class="control-label" for="gender">Gender</label>
                                                    <select id="gender" name="gender" class="form-control">
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                            </div>
	                                        <div class="form-group">
	                                            <label for="email">Email</label>
	                                            <input type="text" class="form-control" id="email" placeholder="email@gmail.com" name="email" required>
	                                        </div>
	                                        <div class="form-group">
	                                            <label for="department">Department</label>
	                                            <select class="form-control" id="department" name="department">
	                                            	<option value="" selected>None</option>
													<?php
														$dep = new Department();
														$departments = $dep->getAllDepartment();
														while($department = $departments->fetch_object()){
													?>
														<option value="<?php echo $department->dept_id; ?>" ><?php echo $department->name; ?></option>
													<?php
														}
													?>
												</select>	
	                                        </div>

                                            <div class="form-group">
                                                <label for="semester">Semester</label>
                                                <select name="semester" id="semester" class="form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="courses">Courses</label>
                                                <select id="courses" multiple="multiple">
                                                    
                                                </select>
                                            </div>

	                                        <div class="form-group">
	                                            <label for="studentMobile">Mobile</label>
	                                            <input type="text" class="form-control" type="number" id="studentMobile" placeholder="+63" name="mobile" maxlength="10">
	                                        </div>
                                            <div class="form-group">
	                                            <label for="studentAddress">Home Address</label>
	                                            <textarea class="form-control" id="studentAddress" rows="4" cols="50" placeholder="Street, Brgy, City" name="home_address" required>
                                                </textarea>
	                                        </div>
	                                        
	                                    </div><!-- /.box-body -->
	
	                                    <div class="box-footer">
	                                        <button type="submit" class="btn btn-primary" name='submit' onclick="trimAllRequiredFields()">Submit</button>
	                                    </div>
	                                </form>

	                            </div>
	                     </div>
	                </section>

		<!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            function trimAllRequiredFields(){
                console.log("started trim");
                $('input,textarea,select').filter('[required]:visible').each(function( index ) {
                    let x = $(this).val();
                    this.value = x.trim();
                }); 
            }
        </script>
        <!-- AJAX FORM -->
        <script type="text/javascript" src="js/jquery.form.js"></script>
		<script type="text/javascript" src="js/add_new_student.js"></script>
        <!-- https://www.jqueryscript.net/form/jQuery-Multiple-Select-Plugin-For-Bootstrap-Bootstrap-Multiselect.html#:~:text=Bootstrap%20Multiselect%20is%20a%20jQuery,3%20Version%20is%20available%20here. -->
        <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
        <script src="students/js/main.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        