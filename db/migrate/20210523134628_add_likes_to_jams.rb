class AddLikesToJams < ActiveRecord::Migration[6.1]
  def change
    add_column :jams, :likes, :integer, default: 0
  end
end
