class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :service, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.references :check_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
