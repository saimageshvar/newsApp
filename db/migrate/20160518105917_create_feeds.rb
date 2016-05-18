class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :url
      t.integer :c_id

      t.timestamps null: false
    end
  end
end
