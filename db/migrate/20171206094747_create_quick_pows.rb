class CreateQuickPows < ActiveRecord::Migration
  def change
    create_table :quick_pows do |t|
      t.string :basis
      t.string :exponent
      t.string :ring_of_residues
      t.string :result

      t.timestamps null: false
    end
  end
end
