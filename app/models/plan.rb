class Plan < ApplicationRecord
	validates :monthly_fee, presence: true, numericality: true
  validates :name, presence: true, length: { minimum: 2 }

	has_many :features
	has_many :subscriptions
end
