class AddRateToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :rate, :boolean
  end
end
