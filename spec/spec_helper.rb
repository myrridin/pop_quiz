require_relative '../lib/pop_quiz.rb'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
end
