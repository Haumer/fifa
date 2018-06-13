class AddStatusToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :match_status, :string, default: "Not played"
  end
end
