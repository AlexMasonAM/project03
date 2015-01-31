class CreatePreferenceLists < ActiveRecord::Migration
  def change
    create_table :preference_lists do |t|

      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :preference_lists, :users
  end
end
