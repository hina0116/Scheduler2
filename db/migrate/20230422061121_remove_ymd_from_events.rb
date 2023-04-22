class RemoveYmdFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :ymd, :date
  end
end
