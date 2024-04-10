class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :feature, foreign_key: { to_table: :earthquake }

      t.timestamps
    end
  end
end
