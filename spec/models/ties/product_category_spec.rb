RSpec.describe Ties::ProductCategory, instance_name: :tie do
  let(:tie) { build_stubbed(:product_category) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(tie).to belong_to(:product)
      expect(tie).to belong_to(:category)
    end
  end
end
