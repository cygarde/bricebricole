class AddLatitudeToChantiers < ActiveRecord::Migration[6.0]
  def change
    add_column :chantiers, :latitude, :float
  end
end
