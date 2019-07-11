class ChangeFieildToExcesdDefinition < ActiveRecord::Migration
  def change
    change_column :excess_definitions, :v_value, :string
    change_column :excess_definitions, :d_value, :string
    change_column :excess_definitions, :i_value, :string
    change_column :excess_definitions, :h_value, :string
    change_column :excess_definitions, :const, :string
  end
end
