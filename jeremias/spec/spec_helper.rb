require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'vcr'

Capybara.default_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end

Capybara.app_host = 'https://jsonplaceholder.typicode.com'

core_path = File.join(Dir.pwd, 'lib', '**', '*.rb')
Dir.glob(core_path).each { |file| require file }

# VCR
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :faraday
  config.default_cassette_options = { record: :once }
end


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    config.include Capybara::DSL
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
