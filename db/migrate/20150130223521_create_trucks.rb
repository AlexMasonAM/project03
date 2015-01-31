class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :genre
      t.string :twitter_handle
      t.string :yelp_id
      t.string :yelp_ratings
      t.string :tweet_most_recent

      t.references :truck_account, index: true

      t.timestamps null: false
    end
    add_foreign_key :trucks, :truck_accounts
  end
end
