class AddEndToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :end, :datetime
  end
end
