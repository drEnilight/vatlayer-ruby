# frozen_string_literal: true

module Vatlayer
  class Api
    attr_reader :access_key, :https

    def initialize(access_key, https)
      @access_key = access_key
      @https = https
    end
  end
end
