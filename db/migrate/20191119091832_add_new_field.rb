class AddNewField < ActiveRecord::Migration
  def change
    add_column :check_lists, :comment, :text
    add_column :people, :car_mileage, :string
    add_column :check_lists, :order_date, :date
  end
end
