class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    user = User.from_oauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in(user)
      redirect_to root_path
    else
      flash[:error] = "Something went wrong!"
      redirect_to root_path
    end
  end

end
