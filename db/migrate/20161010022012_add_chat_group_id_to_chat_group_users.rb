class AddChatGroupIdToChatGroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_group_users, :chat_group_id, :integer, null: false, index: true
    add_column :chat_group_users, :user_id, :integer, null: false, index: true
  end
end
