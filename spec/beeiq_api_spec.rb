RSpec.describe BeeiqAPI do
  it "has a version number" do
    expect(BeeiqAPI::VERSION).not_to be nil
  end

  before(:each) { WebMock.enable! }
  after(:each) do
    WebMock.reset!
    WebMock.disable!
  end

  describe 'new' do
    subject { BeeiqAPI::Client.new(webhook_url, sender_email) }

    context 'given webhook, email' do
      let(:webhook_url) { 'https://github.com' }
      let(:sender_email) { 'huyhung1994@gmail.com' }

      it { is_expected.to be_a BeeiqAPI::Client }
    end

    context 'missing webhook' do
      let(:webhook_url) { '' }
      let(:sender_email) { 'huyhung1994@gmail.com' }

      it { expect{ subject }.to raise_error(ArgumentError, 'Missing webhook url') }
    end

    context 'missing sender_email' do
      let(:webhook_url) { 'https://github.com' }
      let(:sender_email) { '' }

      it { expect{ subject }.to raise_error(ArgumentError, 'Missing sender_email') }
    end
  end

  describe "#configure" do
    before do
      BeeiqAPI.configure do |config|
        config.webhook_url = 'https://github.com'
        config.sender_email = 'huyhung1994@gmail.com'
      end
    end

    it 'valid webhook_url' do
      expect(BeeiqAPI.configuration.webhook_url).to eq 'https://github.com'
    end

    it 'valid sender_email' do
      expect(BeeiqAPI.configuration.sender_email).to eq 'huyhung1994@gmail.com'
    end
  end

  describe '.create_ticket' do
    subject { BeeiqAPI::Client.new(webhook, sender).create_ticket(data) }

    let(:webhook) { 'https://github.com' }
    let(:sender) { 'huyhung1994@gmail.com' }
    let(:data) { { name: 'Huy Hung', phone: '0377197001', 'title': 'ticket tile', body: 'ticket body' }  }

    context 'success' do
      before do
        stub_request(:post, webhook).
          to_return(status: 200, body: 'OK')
      end

      it { expect(subject.success?).to be true }
      it { expect(subject).to be_a BeeiqAPI::Response }

      context 'response' do
        it { expect(subject.body).to include(:success) }
        it { expect(subject.body[:success]).to be true }
      end
    end

    context 'fail' do
      before do
        stub_request(:post, webhook).
          to_return(status: 404, body: "{\"success\":false,\"message\":\"Resource not found\"}")
      end

      it { expect(subject.success?).to be false }
      it { expect(subject).to be_a BeeiqAPI::Response }

      context 'response' do
        it { expect(subject.body).to include(:success, :message) }
        it { expect(subject.body[:success]).to be false }
      end
    end
  end
end
