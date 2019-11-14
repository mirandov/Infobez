class Person < ActiveRecord::Base
  has_many   :people_file_cars
  validates :first_name, :second_name, :patronymic, :contact_phone,
    :mark_car, :model_car, :number_car, :last_visit, presence: true
  def full_name
    "#{first_name} #{second_name} #{patronymic}"
  end

  def full_model
    "#{mark_car} #{model_car} "
  end

end
