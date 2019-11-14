class AddUploadToPeople < ActiveRecord::Migration
  def change
    add_column :people, :upload, :string
  end
end
