class AddColumnProposalInEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :status, :string
  end
end
