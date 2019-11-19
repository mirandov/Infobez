class Admin < ActiveRecord::Base
  has_many :check_lists
  validates :first_name, :second_name, :patronymic, presence: true

  def full_name
    "#{first_name} #{second_name} #{patronymic}"
  end
end
