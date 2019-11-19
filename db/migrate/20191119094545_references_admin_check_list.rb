class ReferencesAdminCheckList < ActiveRecord::Migration
  def change
    add_reference :check_lists, :admin, index: true, foreign_key: true
  end
end
