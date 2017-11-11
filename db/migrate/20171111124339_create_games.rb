class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :card1
      t.string :card2
      t.string :card3
      t.string :card4
      t.string :card5

      t.timestamps
    end
  end
end
