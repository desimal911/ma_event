class AddCategoryToEvents < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :events, :category
  end
end
