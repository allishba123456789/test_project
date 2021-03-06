class Usage < ApplicationRecord
  validates :no_of_units_used, presence: true, :numericality => { only_integer: true }
  belongs_to :feature
  belongs_to :subscription
end
