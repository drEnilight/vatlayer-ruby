# frozen_string_literal: true

module Vatlayer
  class Api
    attr_reader :access_key

    def initialize(access_key)
      @access_key = access_key
    end
  end
end
