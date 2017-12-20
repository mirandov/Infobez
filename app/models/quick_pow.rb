class QuickPow < ActiveRecord::Base
  validates :basis, :exponent, :ring_of_residues, presence: true
  validates :basis, :exponent, numericality: { greater_than_or_equal_to: 0}
  validates :ring_of_residues, numericality: { greater_than: 0}
end
