class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :match_id
      t.string :home_country
      t.string :away_country
      t.string :date
      t.string :location
      t.string :group

      t.timestamps
    end
  end
end
