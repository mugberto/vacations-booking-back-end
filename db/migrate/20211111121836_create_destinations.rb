class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :location
      t.string :image_url
      t.string :cost_per_day

      t.timestamps
    end
  end
end
