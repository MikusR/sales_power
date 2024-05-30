RSpec.describe Product, instance_name: :product do
  let(:product) { build_stubbed(:product) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failures do
      expect(product).to have_many(:ties_to_categories)
      expect(product).to have_many(:categories)
    end
  end

  describe 'validations' do
    describe '#validate_clothing_weight' do
    end
  end
end
