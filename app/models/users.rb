class Users < ActiveRecord::Base
  attr_accessible :address, :description, :email, :name
  validates :name, :presence => true
  validates :address,length: {maximum: 140}
end
