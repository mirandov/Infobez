class Admin < ActiveRecord::Base
  has_many :check_lists

  def full_name
    "#{first_name} #{second_name} #{patronymic}"
  end
end
