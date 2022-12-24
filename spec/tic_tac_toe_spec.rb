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
          allow(game_length).to receive(:print)
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
          allow(game_length).to receive(:print)
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
          allow(game_length).to receive(:print)
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

  describe '#update_display' do
    subject(:game_update) { described_class.new }
    context 'when user enters correct input' do
      it 'should call #display' do
        expect(game_update).to receive(:display).twice
        game_update.update_display('1', 'X')
        game_update.update_display('2', 'O')
      end
      it '@inputs should increase by 1' do
        allow(game_update).to receive(:puts)
        inputs = game_update.instance_variable_get(:@inputs)
        expect { game_update.update_display('1', 'X') }.to change { inputs.length }.by 1
      end
    end
    context 'when user repeat the same number' do
      it 'returns Square already used' do
        allow(game_update).to receive(:display)
        error_message = 'Square already used, Try another empty square'
        expect(game_update).to receive(:puts).with(error_message).exactly(1).time
        game_update.update_display('1', 'X')
        game_update.update_display('1', 'O')
      end
      it 'changes @err to true' do
        allow(game_update).to receive(:puts)
        game_update.update_display('1', 'X')
        game_update.update_display('1', 'O')
        err = game_update.instance_variable_get(:@err)
        expect(err).to be true
      end
    end
    context 'when a user enters wrong input' do
      it '@err switches to true' do
        allow(game_update).to receive(:puts)
        game_update.update_display('!', 'X')
        err = game_update.instance_variable_get(:@err)
        expect(err).to be true
      end
    end
    context 'when a user enters a letter instead of a number' do
      it 'returns wrong input' do
        error_message = 'Wrong input type please enter a number from 1 to 9'
        expect(game_update).to receive(:puts).with error_message
        game_update.update_display('k', 'X')
      end
      it '@err switches to true' do
        allow(game_update).to receive(:puts)
        game_update.update_display('h', 'X')
        err = game_update.instance_variable_get(:@err)
        expect(err).to be true
      end
    end
    context 'when a user enter a number > 9' do
      it 'returns wrong input' do
        error_message = 'Wrong input type please enter a number from 1 to 9'
        expect(game_update).to receive(:puts).with error_message
        game_update.update_display('10', 'X')
      end
    end
    context 'when a user enter number < 1' do
      it 'returns wrong input' do
        error_message = 'Wrong input type please enter a number from 1 to 9'
        expect(game_update).to receive(:puts).with error_message
        game_update.update_display('-2', 'X')
      end
    end
  end

  
end
