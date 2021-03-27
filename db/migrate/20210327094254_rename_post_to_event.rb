class RenamePostToEvent < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :events
  end
end
