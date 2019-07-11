class CreateExcessDefinitions < ActiveRecord::Migration
  def change
    create_table :excess_definitions do |t|
      t.float :v_value
      t.float :d_value
      t.float :i_value
      t.float :h_value

      t.timestamps null: false
    end
  end
end
