
class LocationsController < ApplicationController
	def index
		@locations = Location.all
		respond_to do |format|
			format.json { render json: @locations }
			format.html { render json: @locations }
		end
	end
end
