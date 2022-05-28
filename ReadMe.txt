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
	12. type in : pip install -r requirements.txt
	13. Start xampp apache and mysql,
	14. go to phpmyadmin and create a new database named : csvu$csvu_database
	15. Click on import -> then browse the db-backup.sql


##To Run the local server##
	1. Make sure to perform steps 9, 10, 11 first	
	2. type in : python manage.py runserver
	
	
	

