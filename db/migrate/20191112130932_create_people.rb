class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :string
      t.string :patronymic
      t.string :sex
      t.string :contact_phone

      t.timestamps null: false
    end
  end
end
