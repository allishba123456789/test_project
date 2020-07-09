class Transaction < ApplicationRecord
	validates :date, :chargeable_type, :amount, presence: true
	validates :amount, numericality: true
#	validates :chargeable_type inclusion
  belongs_to :chargeable, polymorphic: true

end
