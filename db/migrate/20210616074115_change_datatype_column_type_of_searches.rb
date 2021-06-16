class ChangeDatatypeColumnTypeOfSearches < ActiveRecord::Migration[6.1]
  def change
    change_column :searches, :column_type, :string
  end
end
