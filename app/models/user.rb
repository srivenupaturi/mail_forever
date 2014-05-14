class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :user_name
  has_many :recipients

  def initialize attributes = {}
    @email = attributes[:email]
    @hashed_password = processed_password(attributes[:hashed_password])
    @name = attributes[:name]
    @user_name = attributes[:user_name]
  end

  #TODO
  def processed_password text_password
     text_password
  end
end
