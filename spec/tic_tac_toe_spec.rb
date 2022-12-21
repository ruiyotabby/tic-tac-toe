require './tic_tac_toe'

describe Game do
  subject(:game_names) { described_class.new }

  describe '#get_names' do
    context 'when a user inputs name' do
      it 'saves in name instance variable' do
        allow(game_names).to receive(:gets).and_return('joe', 'james')
        name = game_names.instance_variable_get(:@name)
        expect(name).to eq 'joe'
        game_names.get_names
      end
    end
  end
end
