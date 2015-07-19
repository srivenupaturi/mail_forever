class Group < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :recipients, through: :group_recipients
end
