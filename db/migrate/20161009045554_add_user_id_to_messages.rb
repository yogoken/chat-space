class AddUserIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :user_id, :integer, null: false, index: true
  end
end
