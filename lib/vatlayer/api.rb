# frozen_string_literal: true

require 'http'

module Vatlayer
  class Api
    attr_reader :access_key, :https

    def initialize(access_key, https)
      @access_key = access_key
      @https = https
    end

    def validate(number)
      params = { vat_number: number }
      request('/validate', params)
    end

    private

    def api_base_url
      https ? 'https://apilayer.net/api' : 'http://apilayer.net/api'
    end

    def request(path, params)
      response = HTTP.get(api_base_url + path, params: prepared_params(params)).parse
      response.each_with_object({}) { |(k, v), h| h[k] = v.is_a?(String) ? v.tr("\n", ' ') : v }
    end

    def prepared_params(params)
      params.merge(access_key: access_key)
    end
  end
end
