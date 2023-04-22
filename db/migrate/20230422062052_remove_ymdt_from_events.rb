class RemoveYmdtFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :ymdt, :datetime
  end
end
