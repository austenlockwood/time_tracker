class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  # Memoized for performance only hit DB once
  def current_user
    @current_user ||= Developer.find_by(id: session[:developer_id])
  end

  # Check if a current_user is present otherwise redirect them.
  def check_for_authorized_user
    unless current_user
      redirect_to sessions_new_path
    end
  end

end
