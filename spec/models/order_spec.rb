RSpec.describe Order, instance_name: :order do
  let(:order) { build_stubbed(:order) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(order).to belong_to(:customer)
    end
  end
end
