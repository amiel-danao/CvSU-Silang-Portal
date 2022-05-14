from django.shortcuts import render
import pyrebase

# Remember the code we copied from Firebase.
#This can be copied by clicking on the settings icon > project settings, then scroll down in your firebase dashboard
config={
    "apiKey": "AIzaSyBfy7mq9KKMIBclRksYjIqbDSCZvdnG9DE",
    "authDomain": "csvu-portal.firebaseapp.com",
    "projectId": "csvu-portal",
    "storageBucket": "csvu-portal.appspot.com",
    "messagingSenderId": "308913574014",
    "appId": "1:308913574014:web:a2d83fba0172a194a4482f",
    "measurementId": "G-QLPGLSFEMD",
    "databaseURL": "https://csvu-portal-default-rtdb.asia-southeast1.firebasedatabase.app/"
}

#here we are doing firebase authentication
firebase=pyrebase.initialize_app(config)
authe = firebase.auth()
database=firebase.database()


def index(request):
        #accessing our firebase data and storing it in a variable
        name = database.child('Data').child('Name').get().val()
        stack = database.child('Data').child('Stack').get().val()
        framework = database.child('Data').child('Framework').get().val()
    
        context = {
            'name':name,
            'stack':stack,
            'framework':framework
        }
        return render(request, 'index.html', context)