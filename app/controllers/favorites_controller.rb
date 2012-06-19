
class FavoritesController < ApplicationController
	def create
		Favorite.create(
			customer_id: current_customer.id, 
			item_id: params[:item_id]
		)

		render nothing: true
	end
	
	def destroy
		# Destroy the favorite based on the request
		Favorite.where(
			"item_id = ? AND customer_id = ?", 
			params[:id], 
			current_customer[:id]
		).first.destroy

		render nothing: true
	end
end
