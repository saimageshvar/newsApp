class AddLangToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :lang_id, :int
  end
end
