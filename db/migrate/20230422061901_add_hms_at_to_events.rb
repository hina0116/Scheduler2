class AddHmsAtToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :hms_at, :time
  end
end
