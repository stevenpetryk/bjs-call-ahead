
class StaticController < ApplicationController
  def home
  	@categories = Category.all
  end
end
