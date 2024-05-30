RSpec.describe Comment, instance_name: :comment do
  let(:comment) { build_stubbed(:comment) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failues do
      expect(comment).to belong_to(:manager)
      expect(comment).to belong_to(:topic)
    end
  end
end
