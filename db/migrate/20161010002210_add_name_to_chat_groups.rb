class AddNameToChatGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_groups, :name, :string
  end
end
