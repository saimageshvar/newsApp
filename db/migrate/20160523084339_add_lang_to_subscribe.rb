class AddLangToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :lang_id, :int
  end
end
