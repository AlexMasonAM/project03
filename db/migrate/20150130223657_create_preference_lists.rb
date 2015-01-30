class CreatePreferenceLists < ActiveRecord::Migration
  def change
    create_table :preference_lists do |t|

      t.timestamps null: false
    end
  end
end
