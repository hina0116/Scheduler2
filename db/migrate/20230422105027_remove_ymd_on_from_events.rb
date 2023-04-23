class RemoveYmdOnFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :ymd_on, :datetime
  end
end
