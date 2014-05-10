class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :user_id
      t.string :recipient_email
      t.datetime :disabled_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
