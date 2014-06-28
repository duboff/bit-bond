class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def angel
    auth = env["omniauth.auth"]
    @user = User.connect_to_angel(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def after_sign_up_path_for(user)
    user_path(user)
  end

  def after_sign_in_path_for(user)
    user_path(user)
  end

end