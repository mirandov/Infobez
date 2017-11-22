class CreateRc4Programs < ActiveRecord::Migration
  def change
    create_table :rc4_programs do |t|
      t.string :key
      t.string :transient_message
      t.string :chanted_message
      t.string :message_text

      t.timestamps null: false
    end
  end
end
