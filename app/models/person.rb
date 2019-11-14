class Person < ActiveRecord::Base
  has_many   :people_file_cars
  def full_name
    "#{first_name} #{second_name} #{patronymic}"
  end

  def full_model
    "#{mark_car} #{model_car} "
  end

end
