require 'valid_email'
class Customer < ActiveRecord::Base
  has_secure_password
  include ActiveModel::Validations
  attr_accessible :items, :email, :name, :password, :password_confirmation, :password_digest, :phone, :zip

  validates :name, presence: true, length: { minumum: 5, maximum: 30 }
  validates :email, email: true
  validates :phone, numericality: true
  validates :password, presence: { on: :create }
  validates :zip, numericality: true, length: { minumum: 5, maximum: 5 }

  has_many :favorites
  has_many :items, through: :favorites
end
