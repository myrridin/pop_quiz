RSpec.describe PopQuiz::File do
  describe '.read_and_require' do
    it 'returns read data from a file' do
      expect(PopQuiz::File.read_and_require('example_classes/thing.rb')).to eq File.read('example_classes/thing.rb')
    end

    it 'requires the file' do
      PopQuiz::File.read_and_require('example_classes/thing.rb')
      expect(Thing).to be_a Class
    end

    it 'returns an error when given a file that does not exist' do
      expect { PopQuiz::File.read_and_require('example_classes/not_a_real_file.rb') }.to raise_error PopQuiz::FileException
    end

    it 'returns an error when given a file that cannot be required' do
      expect { PopQuiz::File.read_and_require('example_classes/invalid_thing.rb') }.to raise_error PopQuiz::RequireException
    end
  end
end