class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessor :email, :password, :password_confirmation, :remember_me
  #attr_accessor :remember_me

  has_one :profile
  has_many :orders


end
