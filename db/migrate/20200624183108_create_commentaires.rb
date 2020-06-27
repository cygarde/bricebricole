class CreateCommentaires < ActiveRecord::Migration[6.0]
  def change
    create_table :commentaires do |t|
      t.text :content
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
