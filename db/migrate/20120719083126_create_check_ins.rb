class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :location
      t.string :message
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
