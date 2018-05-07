# frozen_string_literal: true

class Configuration
  attr_accessor :access_key, :https

  def initialize
    @access_key = 'Your Access key'
    @https = false
  end
end
