class RenameDateTimeForEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :date_time, :starts_at
  end
end
