class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :goals_for
      t.integer :goals_against
      t.integer :yellow_card
      t.integer :red_card
      t.string :photo
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
