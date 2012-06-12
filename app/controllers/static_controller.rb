
class StaticController < ApplicationController
  def home
  	if current_customer.nil?
  		redirect_to login_path
  	else
  		@categories = Category.all
  	end
  end
end
