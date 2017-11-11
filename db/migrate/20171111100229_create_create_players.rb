class CreateCreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :create_players do |t|
      t.string :name
      t.string :card1
      t.string :card2

      t.timestamps
    end
  end
end
