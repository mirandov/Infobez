class PeopleFileCar < ActiveRecord::Base
  belongs_to :person
  belongs_to :file_car
  accepts_nested_attributes_for :file_car, reject_if: :all_blank, allow_destroy: true
end
