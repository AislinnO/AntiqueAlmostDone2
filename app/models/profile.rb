class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  #attr_accessor :firstname, :lastname, :email, :address, :phone, :user_id
  #attr_accessor :user_id
end
