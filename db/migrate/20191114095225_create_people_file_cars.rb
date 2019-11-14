class CreatePeopleFileCars < ActiveRecord::Migration
  def change
    create_table :people_file_cars do |t|
      t.references :person, index: true, foreign_key: true
      t.references :file_car, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
