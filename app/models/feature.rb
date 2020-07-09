class Feature < ApplicationRecord
	validates :name, :code, :unit_price, presence: true
  validates :name, length: { minimum: 2 }
  validates :code, uniqueness: true
  validates :unit_price, numericality: true

	belongs_to :plan
	has_many :usages
	has_many :transactions, as: :chargeable
end
