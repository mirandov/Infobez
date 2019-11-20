class CheckList < ActiveRecord::Base
  belongs_to :person
  belongs_to :admin

  ransack_alias :admin, :admin_first_name_or_admin_second_name

  has_many :orders
  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

  validates :admin_id, :order_date, :sale, :comment, presence: true
end
