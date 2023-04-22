class RemoveContentFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :content, :text
  end
end
