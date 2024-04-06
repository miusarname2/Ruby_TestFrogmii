class CreateEarthquakes < ActiveRecord::Migration[7.0]
  def change
    create_table :earthquakes do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :title
      t.string :mag_type
      t.boolean :tsunami
      t.string :time
      t.string :place
      t.decimal :magnitude
      t.string :externa_id
      t.string :type
      t.string :fakeType

      t.timestamps
    end
  end
end
