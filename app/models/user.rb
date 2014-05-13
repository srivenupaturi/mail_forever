class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :user_name
  has_many :recipients
end
