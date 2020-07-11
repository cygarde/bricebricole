class ChangeTelephonesInClients < ActiveRecord::Migration[6.0]
  def change
    change_column :clients, :telephone_1, :string
    change_column :clients, :telephone_2, :string
  end
end
