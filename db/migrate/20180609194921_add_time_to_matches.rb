class AddTimeToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :time, :string
  end
end
