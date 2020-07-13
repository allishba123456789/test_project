class Transaction < ApplicationRecord
	validates :date, :chargeable_type, :amount, presence: true
	validates :amount, numericality: true
  belongs_to :chargeable, polymorphic: true
  
end
