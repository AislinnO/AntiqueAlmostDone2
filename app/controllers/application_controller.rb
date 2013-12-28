class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    "/myprofile"
  end

  def ensure_admin
    unless current_user && current_user.admin?
      redirect_to "/"
      flash[:error] = "You need to be an admin to access this page!"
    end
  end

end