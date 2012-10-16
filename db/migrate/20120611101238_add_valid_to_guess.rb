class AddValidToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :paid, :boolean, :default => false
  end
end
