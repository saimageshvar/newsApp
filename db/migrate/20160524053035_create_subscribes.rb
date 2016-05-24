class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.integer :user_id
      t.integer :feed_id
      t.integer :lang_id
      t.integer :star

      t.timestamps null: false
    end
  end
end
