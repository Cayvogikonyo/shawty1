class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "shawty", password: "1234"
  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end

end
