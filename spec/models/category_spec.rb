RSpec.describe Category, instance_name: :category do
  let(:category) { build_stubbed(:category) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(category).to have_many(:ties_to_products)
      expect(category).to have_many(:products)
    end
  end
end
