class RemoveHmsAtFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :hms_at, :datetime
  end
end
