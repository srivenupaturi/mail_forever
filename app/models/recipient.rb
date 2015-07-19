class Recipient < ActiveRecord::Base
  attr_accessible :deleted_at, :disabled_at, :recipient_email, :user_id
  belongs_to :user
  has_many :groups, through: :group_recipients

  def initialize attributes = {}
    @user_id = attributes[:user_id]
    @recipient_email = attributes[:recipient_email]
    @deleted_at = attributes[:deleted_at]
    @disabled_at = attributes[:disabled_at]
  end
end
