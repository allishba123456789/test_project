class Plan < ApplicationRecord
	validates :name, :monthly_fee, presence: true
	validates :monthly_fee, numericality: true
  validates :name, length: { minimum: 2 }

	has_many :features
	has_many :subscriptions
end
