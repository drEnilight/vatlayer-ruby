require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/configuration'))

module Vatlayer
  extend self
  attr_accessor :configuration

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration)
  end

  def new(access_key = Vatlayer.configuration.access_key)
    Api.new(access_key)
  end
end
