class AddYmdtToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :ymdt, :datetime
  end
end
