class AddYmdOnToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :ymd_on, :date
  end
end
