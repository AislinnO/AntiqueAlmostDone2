class Order < ActiveRecord::Base
  has_many :orderitems, dependent: :destroy
  has_many :items, through: :orderitems
  belongs_to :user
  belongs_to :profiles
end