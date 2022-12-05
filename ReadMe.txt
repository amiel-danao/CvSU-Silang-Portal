##For First Time Setup only##
	1. Click start menu -> search : Environment Variables
	2. Click Environment Variables - > Under System Variables -> click New
	3. for key field type in : DJANGO_ENV
	4. for value field type in : LOCAL
	5. Open Vscode
	6. Click Terminal -> New Terminal
	7. On upper right of terminal, click the dropdown beside the + icon -> then select command prompt
	8. On the terminal type in : python -m venv myenv
		a folder myenv should be created...
	9. type in : cd myenv/scripts
	10. type in : .\activate
	11. go back to CvSU-Silang-Portal folder by typing : cd ../../
	12. download & install git https://github.com/git-for-windows/git/releases/download/v2.37.3.windows.1/Git-2.37.3-64-bit.exe
	13. type in : pip install -r requirements.txt
	14. Start xampp apache and mysql,
	15. go to phpmyadmin and create a new database named : csvu$csvu_database
	16. type in : python manage.py migrate
	17. 	
	type in : 
	python manage.py shell
	from django.contrib.contenttypes.models import ContentType
	ContentType.objects.all().delete()
	exit()
	python manage.py loaddata fixtures_before_excel_import.json --exclude=auth.permission --exclude=contenttypes --exclude=fireapp.student --exclude=fireapp.quizdata --exclude=fireapp.teacher --exclude=fireapp.grade --exclude=admin.logentry --ignorenonexistent

	
	18.(if no admin user yet run this command)
	python manage.py createsuperuser


##To Run the local server##
	1. Make sure to perform steps 9, 10, 11 first	
	2. type in : python manage.py runserver
	
	
	

