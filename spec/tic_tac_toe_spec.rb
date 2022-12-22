require './tic_tac_toe'

describe Game do

  describe '#get_names' do
    subject(:game_names) { described_class.new }

    context 'when a user inputs name' do
      before do
        allow(game_names).to receive(:puts)
        allow(game_names).to receive(:print)
        allow(game_names).to receive(:gets).and_return('joe')
      end
      it 'saves in name instance variable' do
        game_names.get_names
        name = game_names.instance_variable_get(:@name)
        expect(name).to eq 'joe'
      end
    end

    context 'when name.length is < 2' do
      before do
        allow(game_names).to receive(:puts).with('Each player must choose a name')
        allow(game_names).to receive(:print).with('Enter a name: ')
        invalid_input = 'k'
        valid_input = 'kelly'
        allow(game_names).to receive(:gets).and_return(invalid_input, invalid_input, valid_input)
      end
      it 'returns error twice' do
        err = 'Failed! Name should be more than 1 character'
        expect(game_names).to receive(:puts).with(err).twice
        game_names.get_names
      end
    end
  end
end
