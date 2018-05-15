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
      Vatlayer::Response.const_set('Data', Vatlayer::Response.instance_variable_get(:@response_class))
                        .new(prepare_elements(response))
    end

    def prepare_elements(response)
      response.each_with_object({}) do |(k, v), h|
        h[k.downcase.split(' ').join('_')] = if v.is_a?(String)
                                               v.tr("\n", ' ')
                                             elsif v.is_a?(Hash)
                                               prepare_elements(v)
                                             else
                                               v
                                             end
      end
    end

    def prepared_params(params)
      params.merge(access_key: access_key)
    end
  end
end
