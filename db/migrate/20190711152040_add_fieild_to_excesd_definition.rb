class AddFieildToExcesdDefinition < ActiveRecord::Migration
  def change
    add_column :excess_definitions, :const, :float
  end
end
