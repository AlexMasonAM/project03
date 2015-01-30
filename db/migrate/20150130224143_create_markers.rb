class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
