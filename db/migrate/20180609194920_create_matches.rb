class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :match_id
      t.references :away_team, index: true, foreign_key: {to_table: :teams}
      t.references :home_team, index: true, foreign_key: {to_table: :teams}
      t.datetime :date
      t.string :location
      t.references :group, foreign_key: true
      t.string :home_name
      t.string :away_name

      t.timestamps
    end
  end
end
