class CheckList < ActiveRecord::Base
  belongs_to :person
  belongs_to :order
  belongs_to :user
end
