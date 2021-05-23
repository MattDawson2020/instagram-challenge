class CreateJams < ActiveRecord::Migration[6.1]
  def change
    create_table :jams do |t|
      t.integer :user_id, null: false
      t.string :caption
      
      t.timestamps
    end
  end
end
