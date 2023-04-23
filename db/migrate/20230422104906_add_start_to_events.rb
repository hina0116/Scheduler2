class AddStartToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :start, :datetime
  end
end
