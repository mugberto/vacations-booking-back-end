RSpec.describe User, type: :model do 
  describe 'associations' do
    it { should have_many(:reservations) }
    it { should have_many(:destinaions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation)}
  end
end