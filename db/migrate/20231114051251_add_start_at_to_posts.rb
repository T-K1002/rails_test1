class AddStartAtToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :start_at, :datetime
    add_column :posts, :end_at, :datetime
  end
end
