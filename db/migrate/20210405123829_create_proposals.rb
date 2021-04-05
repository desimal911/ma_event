class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.belongs_to :request
      t.belongs_to :user
      t.string :description
      t.string :status
      t.integer :price_cents
      t.string :phone_number

      t.timestamps
    end
  end
end
