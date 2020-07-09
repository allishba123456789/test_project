require 'rails_helper'

RSpec.describe Plan, type: :model do

	describe '#name' do
		it { should validate_presence_of :name }
		it { should validate_length_of(:name).is_at_least(2) }  
	end

	describe '#monthly_fee' do
		it { should validate_presence_of(:monthly_fee) }
		it { should validate_numericality_of(:monthly_fee) }
	end

	describe '#Associations' do
		it { should have_many(:subscriptions) }
		it { should have_many(:features) }
	end
end
