class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :user_name
  validates_presence_of :email, :name, :user_name, :hashed_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  
  has_many :recipients

  #TODO: salting
  def self.processed_password text_password
    if text_password
      Digest::MD5.hexdigest(text_password)
    end
  end

  def self.authenticate(options)
    email = options['email']
    password = options['hashed_password']
    if email && password
      user = User.where('email = ?', email).first
      if user && user.hashed_password == User.processed_password(password)
        user
      end
    end
  end
end
