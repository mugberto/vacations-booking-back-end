require 'rails_helper'

RSpec.describe Reservation, type: :model do

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
