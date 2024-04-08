class CreateEarthquakes < ActiveRecord::Migration[7.0]
  def change
    create_table :earthquakes do |t|
      t.decimal :latitude,:null =>  false,numericality: { greater_than: -90.0, less_than: 90.0 }
      t.decimal :longitude,:null =>  false,numericality: { greater_than: -180.0, less_than: 180.0 }
      t.string :title, :null =>  false
      t.string :mag_type,:null => false
      t.boolean :tsunami
      t.string :time
      t.string :place,:null => false
      t.decimal :magnitude,numericality: { greater_than: -1.0, less_than: 10.0 }
      t.string :externa_id
      t.string :type

      t.timestamps
    end
  end
end
