from django.shortcuts import render
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login
from django.contrib.auth.views import LoginView
from django.shortcuts import render, HttpResponseRedirect
from django.urls import reverse


@login_required
def password_change(request):
    if request.method == "POST":
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
    else:
        pass


class MyLoginView(LoginView):
    def form_valid(self, form):
        """Security check complete. Log the user in."""
        auth_login(self.request, form.get_user())
        next_url = self.request.GET.get("next")
        if next_url:
            return HttpResponseRedirect(next_url)
        else:
            return render(self.request, "/")

        # return HttpResponseRedirect(self.get_success_url())
