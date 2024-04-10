class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body,:null => false
      t.references :feature, foreign_key: { to_table: :earthquakes }

      t.timestamps
    end
  end
end
