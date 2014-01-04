require_relative '../lib/viner.rb'

#For all of the tests to pass you need to be authenticated, enter your details below then run rspec.
VINE_USERNAME = nil
VINE_PASSWORD = nil

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'rand:3455'
end
