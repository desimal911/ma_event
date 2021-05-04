class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string

    remove_column :users, :password, :string
    end
  end
