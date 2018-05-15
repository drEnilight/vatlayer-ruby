# frozen_string_literal: true

require 'http'

module Vatlayer
  class Api
    attr_reader :access_key, :https

    def initialize(access_key, https)
      @access_key = access_key
      @https = https
    end

    def rate_list
      request('/rate_list')
    end

    def validate(vat_number:)
      request('/validate', vat_number: vat_number)
    end

    private

    def api_base_url
      https ? 'https://apilayer.net/api' : 'http://apilayer.net/api'
    end

    def request(path, params = {})
      response = HTTP.get(api_base_url + path, params: prepared_params(params)).parse
      Vatlayer::Response::Data.new(remove_lb_element(response))
    end

    def remove_lb_element(response)
      response.each_with_object({}) { |(k, v), h| h[k.downcase] = v.is_a?(String) ? v.tr("\n", ' ') : v }
    end

    def prepared_params(params)
      params.merge(access_key: access_key)
    end
  end
end
