RSpec.describe User, instance_name: :user do
  let(:user) { build_stubbed(:user) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(user).to have_one(:manager)
      expect(user).to have_one(:customer)
    end
  end
end
