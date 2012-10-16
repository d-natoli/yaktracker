class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      
      t.timestamps
    end
  end
end
