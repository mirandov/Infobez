class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.references :person, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer    :sale
      t.integer    :price

      t.timestamps null: false
    end
  end
end
