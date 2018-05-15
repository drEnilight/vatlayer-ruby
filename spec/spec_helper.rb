# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'vatlayer'
require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

RSpec.configure do |config|
  config.before(:all) do
    Vatlayer::Response.const_set('Data', Vatlayer::Response.instance_variable_get(:@response_class))
  end
end
