require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @user = User.create(email: "a@b.c", username: "user1", password: '123456', password_confirmation: '123456')
    @destination = Destination.create(name: 'London', location: 'London', price_per_day: 25,
    image_url: 'https://via.placeholder.com/150')
   
  end

  subject { Reservation.create(user_id: @user.id, destination_id: @destination.id, startingDay: '01/01/2015',
  endingDay: '01/01/2015')}

  it 'create a valid destination object' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:destination_id) }
    it { should validate_presence_of(:startingDay) }
    it { should validate_presence_of(:endingDay) }
  end

  describe 'associations' do
    it { should belong_to(:destination) }
    it { should belong_to(:user) }
  end
end


