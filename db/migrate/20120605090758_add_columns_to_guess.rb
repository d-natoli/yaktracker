class AddColumnsToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :name, :string
    add_column :guesses, :email, :string
    add_column :guesses, :message, :text
  end
end
