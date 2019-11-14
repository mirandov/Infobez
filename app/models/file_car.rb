class FileCar < ActiveRecord::Base
  has_many   :people_file_cars
  mount_uploader :upload, UploadUploader
  mount_uploaders :avatars, AvatarUploader
  
  def filename
   File.basename(path)
  end
  
end
