class Order < ActiveRecord::Base
  belongs_to :service
  belongs_to :person
  belongs_to :check_list
end
