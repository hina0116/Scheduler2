class AddYmdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :ymd, :date
  end
end
