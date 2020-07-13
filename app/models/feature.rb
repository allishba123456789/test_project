class Feature < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :code, presence: true, uniqueness: true
  validates :unit_price, presence: true, numericality: true
  validates :max_no_of_units, presence: true, :numericality => { only_integer: true, :greater_than => 0 }

	belongs_to :plan
	has_many :usages
	has_many :transactions, as: :chargeable

end
