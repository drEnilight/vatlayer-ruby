# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/configuration'))

module Vatlayer
  module_function

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
