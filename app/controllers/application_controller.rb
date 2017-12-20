class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :clear_params
  def clear_params
  params.each_key do |key|
    params[key] = params[key].encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '') if params[key].is_a?(String)
  end
end


end
