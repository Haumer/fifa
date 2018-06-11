class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points, :integer, default: 0
      t.integer :wins, :integer, default: 0
      t.integer :draws, :integer, default: 0
      t.integer :losses, :integer, default: 0
      t.integer :goals_for, :integer, default: 0
      t.integer :goals_against, :integer, default: 0
      t.integer :yellow_card, :integer, default: 0
      t.integer :red_card, :integer, default: 0
      t.string :photo
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
