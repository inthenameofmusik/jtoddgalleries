class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_accessor :full_feature

  protected
  	def authenticate
  		authenticate_or_request_with_http_basic do |username, password|
  			if username == USER_ID && password == PASSWORD
  				logged_in = true
  			end
  		end
  	end

end
