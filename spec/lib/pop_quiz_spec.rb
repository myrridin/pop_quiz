RSpec.describe PopQuiz do
  it 'parses and runs the test class properly' do
    expected_output = {
        'Thing.new.truthy_method == true' => {:success=>true},
        'Thing.new.falsey_method == true' => {:success=>false, :message => 'Quiz returned a falsey value'},
        'Thing.new.error_method' => {:success=>false, :error=>true, :message => 'Error was thrown: Error from Thing'}
    }
    expect(PopQuiz.test_file('example_classes/thing.rb')).to eq expected_output
  end
end