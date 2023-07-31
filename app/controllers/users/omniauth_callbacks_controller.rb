class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth(auth)

    if user.present?
      sign_out_all_scopes
      session[:user_id] = user.id
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    # require 'pry'; binding.pry
    # # Make a call to the BE API and check if this user already exists, if yes do line 28 if no do 26-27 first.
    # facade = UserFacade.new(resource_or_scope)
    # facade.create_user(resource_or_scope)
    stored_location_for(resource_or_scope) || user_path(resource_or_scope.id)
    #create_user
    #redirect_path
  end

  private

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end
