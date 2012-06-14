class Item < ActiveRecord::Base
  belongs_to :category
  cattr_accessor :current_customer

  attr_accessible :id, :description, :name, :price, :category_id, :favorite

  has_many :favorites
  has_many :favorites_customers, through: :favorites, source: :customer

  has_many :options
  
  def favorite
  	favorites_customers.exists?(current_customer.id)
  end
end
