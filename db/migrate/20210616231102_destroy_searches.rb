class DestroySearches < ActiveRecord::Migration[6.1]
  def change
    drop_table :searches
  end
end
