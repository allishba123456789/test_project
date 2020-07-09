require 'rails_helper'

RSpec.describe Subscription, type: :model do

	describe '#Associations' do
		it { should have_many(:transactions) }
		it { should have_many(:usages) }
		it { should belong_to(:plan) }	
		it { should belong_to(:user) }			
	end
end
