class AlterCommentsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :comment
    add_column :comments, :body, :string
  end
end
