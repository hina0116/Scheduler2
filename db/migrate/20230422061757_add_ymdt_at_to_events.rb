class AddYmdtAtToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :ymdt_at, :date
  end
end
