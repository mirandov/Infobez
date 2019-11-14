class CreateFileCars < ActiveRecord::Migration
  def change
    create_table :file_cars do |t|

      t.timestamps null: false
    end
  end
end
