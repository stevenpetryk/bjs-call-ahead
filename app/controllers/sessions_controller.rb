
class SessionsController < ApplicationController
	def create
		customer = Customer.find_by_email(params[:email])
		if customer && customer.authenticate(params[:password])
			session[:customer_id] = customer.id 
			redirect_to root_url
		else
			flash[:notice] = "Invalid email address or password."
			redirect_to new_session_path
		end
	end
	def destroy
		session[:customer_id] = nil
		redirect_to root_url, :notice => "Logged out."
	end
end
