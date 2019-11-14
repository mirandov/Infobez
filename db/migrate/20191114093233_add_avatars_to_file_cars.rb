class AddAvatarsToFileCars < ActiveRecord::Migration
  def change
    add_column :file_cars, :avatars, :json
  end
end
