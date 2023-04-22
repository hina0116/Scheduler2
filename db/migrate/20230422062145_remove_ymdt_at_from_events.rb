class RemoveYmdtAtFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :ymdt_at, :date
  end
end
