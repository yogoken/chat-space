class CreateChatGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_groups do |t|

      t.timestamps
    end
  end
end
