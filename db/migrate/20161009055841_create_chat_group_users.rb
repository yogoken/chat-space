class CreateChatGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_group_users do |t|

      t.timestamps
    end
  end
end
