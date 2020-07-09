require 'rails_helper'

RSpec.describe User, type: :model do

	# subject { User.new(name: "a") }

	describe '#email' do
		it { should validate_presence_of :email }
	end

	describe '#name' do
		it { should validate_presence_of :name }
		it { should validate_length_of(:name).is_at_least(2) }  
	end

	describe '#password' do
		it { should validate_presence_of :password }
		it { should validate_length_of(:password).is_at_least(6) }  
	end

	describe '#billing_day' do
		it { should validate_numericality_of(:billing_day).is_greater_than(0) }
		it { should validate_numericality_of(:billing_day).is_less_than(29) }
		it { should validate_numericality_of(:billing_day).only_integer }
	end

	describe '#role' do
		it { should validate_presence_of :role }
		it { should define_enum_for(:role).with_values(['admin', 'user']) }  
	end

	describe '#Associations' do
		it { should have_many(:subscriptions) }
	end
	# it "ensures email must present" do
	# 	user = User.new(name: "alishba").save
	# 	expect(user).to eq(false)
	# end

	# it "ensures name must present" do
	# 	user = User.new(email: "alishba@gmail.com", billing_day: 3).save
	# 	expect(user).to eq(false)
	# end

	# it "ensures billing day must present" do
	# 	user = User.new(email: "alishba@gmail.com").save
	# 	expect(user).to eq(false)
	# end

	# it "ensures password must present" do
	# 	user = User.new(email: "alishba@gmail.com").save
	# 	expect(user).to eq(false)
	# end

	# it "ensures role must present" do
	# 	user = User.new(email: "alishba@gmail.com", billing_day: 3).save
	# 	expect(user).to eq(false)
	# end

	# it "ensures user is valid" do
	# 	user = User.new(name: "alishba", password: "123456", email: "alishba@gmail.com",
	# 		billing_day: 3, role: "user").save!
	# 	expect(user).to eq(true)
	# end

end
