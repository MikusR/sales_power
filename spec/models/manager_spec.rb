RSpec.describe Manager, instance_name: :manager do
  let(:manager) { build_stubbed(:manager) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(manager).to belong_to(:user)
    end
  end

  describe 'validations' do
    it 'defines these validations through macros', :aggregate_failures do
      expect(manager).to validate_presence_of(:first_name)
      expect(manager).to validate_presence_of(:last_name)
      expect(manager).to validate_inclusion_of(:region).in_array(described_class::REGIONS)
    end
  end

  describe '#full_name' do
    subject(:full_name) { manager.full_name }

    let(:manager) { build_stubbed(:manager, first_name: 'John', last_name: 'Doe') }

    it 'returns a concatenation of first and last name' do
      is_expected.to eq('John Doe')
    end
  end
end
