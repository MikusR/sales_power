RSpec.describe Customer, instance_name: :customer do
  let(:customer) { build_stubbed(:customer) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(customer).to belong_to(:user)
      expect(customer).to have_many(:orders)
    end
  end
end
