
class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end
	def show
		@customer = Customer.find(params[:id])
	end
	def new
		@customer = Customer.new
	end
	def create
		@customer = Customer.create(params[:customer])
		if(@customer.save)
			redirect_to root_path
		else
			render "new"
		end
	end
end
