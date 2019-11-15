class AddFieldToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :price, :integer
    add_column :orders, :name_service, :string
  end
end
