require 'rails_helper'

RSpec.describe Destination, type: :model do
    subject  {Destination.create(name: "London", location: 'London', price_per_day: 25, image_url: 'https://via.placeholder.com/150')}

    it 'create a valid destination object' do
        expect(subject).to be_valid
    end
  
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:location) }
        it { should validate_presence_of(:image_url) }
        it { should validate_presence_of(:price_per_day) }
      end
    
      describe 'associations' do
        it { should have_many(:reservations) }
        it { should have_many(:users).through(:reservations) }
  
      end
end
