module DeviseHelper
  def devise_error_messages!
    return '[]' if resource.errors.empty?
    resource.errors.full_messages
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

  def resource
    @resource ||= User.new
  end
end