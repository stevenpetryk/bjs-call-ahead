class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  	def current_customer
  		@current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  		Item.current_customer = @current_customer
  	end
  	helper_method :current_customer
end
