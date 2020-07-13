class Subscription < ApplicationRecord
	belongs_to :user
	belongs_to :plan
	has_many :usages
	has_many :transactions, as: :chargeable

end
