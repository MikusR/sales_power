RSpec.describe Producer, instance_name: :producer do
  let(:producer) { build_stubbed(:producer) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(producer).to have_many(:products)
    end
  end
  describe 'validations' do
    it 'defines these validations through macros', :aggregate_failures do
      expect(producer).to validate_presence_of(:name)
      expect(producer).to validate_presence_of(:founding_year)
      expect(producer).to validate_numericality_of(:founding_year)
    end
  end
end
