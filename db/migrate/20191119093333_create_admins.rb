class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :second_name
      t.string :patronymic

      t.timestamps null: false
    end
  end
end
