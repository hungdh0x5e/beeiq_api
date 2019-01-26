RSpec.describe BeeiqAPI::Ticket do
  describe '.new' do
    subject{ described_class.new(data) }

    context 'when body empty' do
      let(:data) { { body: '' } }
      it 'raise an error' do
        expect { subject }.to raise_error(ArgumentError, 'body is required')
      end
    end

    context 'when body is given' do
      let(:data) { { body: 'something' } }
      it { is_expected.to be_a ::BeeiqAPI::Ticket }
    end
  end

  describe '.payload' do
    subject { described_class.new(data).payload }

    context 'ignore empty data' do
      let(:data) { { body: 'hello', title: 'title', name: '', contact_id: '' } }
      it { expect(subject).to be_a Hash }
      it { expect(subject).to include(:body, :title) }
      it { expect(subject).not_to include(:name, :contact_id) }
    end
  end
end
