class AddTimeToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :time, :string
    add_column :matches, :date_string, :string
    add_column :matches, :round, :string
  end
end
