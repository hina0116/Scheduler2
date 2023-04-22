class AddPlanAtToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :plan_at, :datetime
  end
end
