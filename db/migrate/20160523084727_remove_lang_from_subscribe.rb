class RemoveLangFromSubscribe < ActiveRecord::Migration
  def change
    remove_column :subscribes, :lang_id, :int
  end
end
