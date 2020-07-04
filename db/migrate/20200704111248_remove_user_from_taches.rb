class RemoveUserFromTaches < ActiveRecord::Migration[6.0]
  def change
    remove_column :taches, :user_id
  end
end
