class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :destinations, :cost_per_day, :price_per_day
  end
end
