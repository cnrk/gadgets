class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    gadgets_path
  end

  protected

  def check_current_user
    unless current_user
      redirect_to root_path, notice: 'Please log in.'
      return
    end
  end
end
