RSpec.describe Rails do
  it { expect(1).to be_present }

  describe 'webmock intercepting remote requests' do
    before do
      stub_request(:any, 'www.example.com').to_return(body: 'yay')
    end

    it 'works real well' do
      uri = URI('http://www.example.com')

      expect(Net::HTTP.get(uri)).to eq('yay')
    end
  end

  describe 'timecop hook' do
    it 'freezes time at specified moment, nifty', freeze_at: '2024-01-01 12:01' do
      expect(Time.current.to_s).to eq('2024-01-01 12:01:00 UTC')
    end
  end
end
