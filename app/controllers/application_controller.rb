class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  	def current_customer
  		@current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  	end
  	helper_method :current_customer
end
