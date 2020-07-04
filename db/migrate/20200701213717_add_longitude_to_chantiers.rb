class AddLongitudeToChantiers < ActiveRecord::Migration[6.0]
  def change
    add_column :chantiers, :longitude, :float
  end
end
