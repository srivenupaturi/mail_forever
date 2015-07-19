class CreateGroupRecipients < ActiveRecord::Migration
  def change
    create_table :group_recipients do |t|
      t.integer :group_id
      t.integer :recipient_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
