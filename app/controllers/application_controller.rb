class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :clear_params
  before_action :authenticate_user!

  def after_sign_in_path(resource)
    mains_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def clear_params
  params.each_key do |key|
    params[key] = params[key].encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '') if params[key].is_a?(String)
  end
end


end
