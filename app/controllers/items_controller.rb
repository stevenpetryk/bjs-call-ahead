
class ItemsController < ApplicationController
	before_filter :fetch_category, :except => [:show, :destroy]
	def index
		@items = @category.items.all
		respond_to do |format|
			format.json { render :json => @items }
			format.html
		end
	end

	private
		def fetch_category
			@category = Category.find(params[:category_id])
		end
end
