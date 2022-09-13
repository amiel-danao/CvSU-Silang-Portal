from django.shortcuts import render
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required


@login_required
def password_change(request):
    if request.method == "POST":
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
    else:
        pass


# def change_password(request):
#     if request.method == "POST":
#         form = PasswordChangeForm(request.user, data=request.POST)
#         if form.is_valid():
#             form.save()
#             update_session_auth_hash(request, form.user)  # dont logout the user.
#             messages.success(request, "Password changed.")
#             return redirect("/")
#     else:
#         form = PasswordChangeForm(request.user)
#     data = {"form": form}
#     return render(request, "accounts/change_password.html", data)
