
class ItemsController < ApplicationController
	before_filter :fetch_category, :except => [:show, :destroy]

	def index
		@items = @category.items.all
		respond_to do |format|
			format.json { render json: @items.to_json(except: :category_id, methods: [ :favorite ]) }
		end
	end

	def show
		@item = Item.find(params[:id])
		respond_to do |format|
			format.json { render :json => @item }
		end
	end

	private
		def fetch_category
			@category = Category.find(params[:category_id])
		end
end
