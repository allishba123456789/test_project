require 'rails_helper'

RSpec.describe Transaction, type: :model do
	describe '#associations'do
	it { should belong_to(:chargeable) }
	end

	describe '#amount' do
	  it { should validate_presence_of(:amount) }
		it { should validate_numericality_of(:amount) }	
	end

	describe '#date' do
	  it { should validate_presence_of(:date) }
	end
end
