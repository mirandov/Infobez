class CheckList < ActiveRecord::Base
  belongs_to :person
  belongs_to :admin
  has_many :orders
  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true
end
