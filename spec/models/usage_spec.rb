require 'rails_helper'

RSpec.describe Usage, type: :model do

	describe '#no_of_units_used' do
		it { should validate_presence_of :no_of_units_used }		
		it { should validate_numericality_of(:no_of_units_used).only_integer }
	end

	describe '#Associations' do
		it { should belong_to(:subscription) }
		it { should belong_to(:feature) }		
	end
 end
