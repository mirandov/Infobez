class Rc4Program < ActiveRecord::Base
  validates :transient_message, presence: true
  validates :key, presence: true
  validate  :nil_or_present

  def nil_or_present
    if key.to_s == ""
      errors.add(:key, "не может быть пусткой строкой")
    end
  end
end
