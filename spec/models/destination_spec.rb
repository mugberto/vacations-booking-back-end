require 'rails_helper'

RSpec.describe Destination, type: :model do
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
