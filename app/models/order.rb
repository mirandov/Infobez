class Order < ActiveRecord::Base
  belongs_to :service
  belongs_to :person
end
