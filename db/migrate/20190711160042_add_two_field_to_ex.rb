class AddTwoFieldToEx < ActiveRecord::Migration
  def change
    add_column :excess_definitions, :min, :string
    add_column :excess_definitions, :sec, :string
  end
end
