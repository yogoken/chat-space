class AddImageToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :image, :string
  end
end
