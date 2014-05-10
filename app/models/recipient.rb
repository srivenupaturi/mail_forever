class Recipient < ActiveRecord::Base
  attr_accessible :deleted_at, :disabled_at, :recipient_email, :user_id
end
