class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "", password: ""
  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end

end
