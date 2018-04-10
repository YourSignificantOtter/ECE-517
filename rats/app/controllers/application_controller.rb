class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_role
    @current_role ||= session[:current_role] if session[:current_role]
    @current_role = @current_role.to_sym unless @current_role.nil?
  end
  helper_method :current_role

  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end
end
