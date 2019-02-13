RSpec.describe BeeiqAPI::Contact do
  describe '.new' do
    subject{ described_class.new(data) }

    context 'when name empty' do
      let(:data) { { name: '' } }
      it 'raise an error' do
        expect { subject }.to raise_error(ArgumentError, 'name is required')
      end
    end

    context 'when name is given' do
      let(:data) { { name: 'something' } }
      it { is_expected.to be_a ::BeeiqAPI::Contact }
    end
  end

  describe '.payload' do
    subject { described_class.new(data).payload }

    context 'ignore empty data' do
      let(:data) { { name: 'hello', title: 'title', gender: 0, emails: [] } }
      it { expect(subject).to be_a Hash }
      it { expect(subject).to include(:name, :title) }
      it { expect(subject).not_to include(:emails) }
    end
  end
end
