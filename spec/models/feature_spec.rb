require 'rails_helper'

RSpec.describe Feature, type: :model do

	describe '#name' do
		it { should validate_presence_of :name }
		it { should validate_length_of(:name).is_at_least(2) }
	end

	describe '#code' do
		it { should validate_presence_of :code }
	end

	describe '#unit_price' do
		it { should validate_presence_of(:unit_price) }
		it { should validate_numericality_of(:unit_price) }
	end

	describe '#Associations' do
		it { should have_many(:transactions) }
		it { should have_many(:usages) }
		it { should belong_to(:plan) }		
	end
end
