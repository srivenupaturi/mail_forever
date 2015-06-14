class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :user_name
  validates_presence_of :email, :name, :user_name 
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: { case_sensitive: false }
  validates :user_name, uniqueness: { case_sensitive: false }
  
  has_many :recipients

  #TODO: salting
  def self.processed_password text_password
    if text_password
      Digest::MD5.hexdigest(text_password)
    end
  end

  def authenticate text_password
    if text_password
      hash = processed_password text_password
      @hashed_password == hash ? @user.reload : nil
    end
  end
end
