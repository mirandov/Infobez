class AddRefToEd < ActiveRecord::Migration
  def change
    add_reference :excess_definitions, :user, index: true, foreign_key: true
  end
end
