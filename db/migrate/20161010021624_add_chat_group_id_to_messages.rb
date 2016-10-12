class AddChatGroupIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :chat_group_id, :integer, null: false, index: true
  end
end
