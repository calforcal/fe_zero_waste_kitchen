require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#initialize" do 
    it "exists and has attributes" do 
      user = create(:user)

      last_created_user = User.all.last

      expect(user).to be_a(User)
      expect(user.id).to be_an(Integer)
      expect(last_created_user.id).to eq(user.id)

      expect(user.uid).to be_a(String)
      expect(last_created_user.uid).to eq(user.uid)

      expect(user.name).to be_a(String)
      expect(last_created_user.name).to eq(user.name)

      expect(user.email).to be_a(String)
      expect(last_created_user.email).to eq(user.email)
    end

    it 'has a valid factory' do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
  end

  describe "#food_saved" do 
    it "gives the number of pounds of food a user has saved" do 
      user = create(:user)

      expect(user.food_saved).to eq(5)
    end
  end
  
  
end
