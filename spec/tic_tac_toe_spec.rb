require './tic_tac_toe'

describe Game do
  describe '#get_names' do
    context 'when a user inputs name' do
      subject(:game_names) { described_class.new }
      before do
        allow(game_names).to receive(:puts)
        allow(game_names).to receive(:print)
        allow(game_names).to receive(:gets).and_return('james', 'joe')
      end
      it 'saves in name instance variable' do
        game_names.get_names
        name = game_names.instance_variable_get(:@name)
        expect(name).to eq 'joe'
      end
    end

    context 'should verify the user input' do
      subject(:game_length) { described_class.new }
      context 'when user inputs a character less than 2 twice' do
        before do
          allow(game_length).to receive(:puts)
          allow(game_length).to receive(:print)
          invalid_input = 'k'
          valid_input = 'kelly'
          allow(game_length).to receive(:gets).and_return(invalid_input, invalid_input, valid_input)
        end
        it 'returns error twice' do
          error = 'Failed! Name should be more than 1 character'
          expect(game_length).to receive(:puts).with(error).exactly(2).times
          game_length.get_names
        end
      end

      context 'when a user inputs a character less than 2 once' do
        before do
          allow(game_length).to receive(:puts)
          invalid_input = 'a'
          valid_input = 'abdi'
          allow(game_length).to receive(:gets).and_return(invalid_input, valid_input, valid_input)
        end
        it 'returns error once' do
          error = 'Failed! Name should be more than 1 character'
          expect(game_length).to receive(:puts).with(error).exactly(1).times
          game_length.get_names
        end
      end

      context 'when a user inputs a character less than two first then a valid input then an invalid input' do
        before do
          allow(game_length).to receive(:puts)
          invalid_input = 'm'
          valid_input = 'mula'
          allow(game_length).to receive(:gets).and_return(invalid_input, valid_input, invalid_input, valid_input)
        end
        it 'returns error twice' do
          error = 'Failed! Name should be more than 1 character'
          expect(game_length).to receive(:puts).with(error).exactly(2).times
          game_length.get_names
        end
      end
      context 'when a user input character more than 1' do
        before do
          allow(game_length).to receive(:puts)
          valid_input = 'kipchge'
          allow(game_length).to receive(:gets).and_return(valid_input, valid_input)
        end
        it 'doesnt return error' do
          error = 'Failed! Name should be more than 1 character'
          expect(game_length).not_to receive(:puts).with(error)
          game_length.get_names
        end
      end
    end

    context 'when first user enter name' do
      subject(:game_player1) { described_class.new }
      it 'should be saved in @player1' do
        allow(game_player1).to receive(:puts)
        allow(game_player1).to receive(:print)
        allow(game_player1).to receive(:gets).and_return('kips', 'moraa')
        game_player1.get_names
        player1 = game_player1.instance_variable_get(:@player1)
        expect(player1).to eq 'kips'
      end
    end

    context 'when second user enters name' do
      subject(:game_player2) { described_class.new }
      it 'should be saved in @player1' do
        allow(game_player2).to receive(:puts)
        allow(game_player2).to receive(:print)
        allow(game_player2).to receive(:gets).and_return('kips', 'moraa')
        game_player2.get_names
        player2 = game_player2.instance_variable_get(:@player2)
        expect(player2).to eq 'moraa'
      end
    end
  end
  describe '#'
end
