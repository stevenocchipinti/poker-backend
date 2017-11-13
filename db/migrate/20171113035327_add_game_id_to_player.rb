class AddGameIdToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :game, index: true
  end
end
