class Order < ActiveRecord::Base
  belongs_to :service
  belongs_to :person
  belongs_to :check_list

  validates :price, :name_service, presence: true
end
