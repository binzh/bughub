class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  helper_method :get_username_by_id, :notification_count

  def get_username_by_id(id)
    User.find(id).username
  end

  def notification_count
    current_user.notifications.size
  end
end
