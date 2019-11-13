class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :second_name
      t.string :mark_car
      t.string :model_car
      t.string :number_car
      t.date   :last_visit
      t.string :description
      t.string :patronymic
      t.string :sex
      t.string :contact_phone

      t.timestamps null: false
    end
  end
end
