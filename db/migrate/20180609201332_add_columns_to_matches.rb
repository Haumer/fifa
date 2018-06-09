class AddColumnsToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :home_team_goals, :integer
    add_column :matches, :away_team_goals, :integer
    add_column :matches, :home_team_yellow_cards, :integer
    add_column :matches, :away_team_yellow_cards, :integer
    add_column :matches, :home_team_red_cards, :integer
    add_column :matches, :away_team_red_cards, :integer
    add_column :matches, :minutes_played, :integer
  end
end
