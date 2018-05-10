# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/configuration'))
require File.expand_path(File.join(File.dirname(__FILE__), 'vatlayer/version'))

module Vatlayer
  module_function

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration)
  end

  def new(access_key = Vatlayer.configuration.access_key, https: Vatlayer.configuration.https)
    Api.new(access_key, https)
  end
end
