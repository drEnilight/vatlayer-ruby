# frozen_string_literal: true

module Vatlayer
  module Response
    @response_class = Class.new do
      attr_reader :error

      def initialize(attributes)
        attributes.each do |(key, value)|
          cleaned_key = key.gsub(/[^0-9A-Za-z_]/, '')
          self.class.class_eval { attr_accessor :"#{cleaned_key}" }
          generate_methods(cleaned_key, value)
        end
      end

      def generate_methods(key, value)
        if value.is_a?(Hash)
          Vatlayer::Response.const_set(key.capitalize, Vatlayer::Response.instance_variable_get(:@response_class))
          public_send("#{key}=", Object.const_get("Vatlayer::Response::#{key.capitalize}").new(value))
        else
          public_send("#{key}=", value)
        end
      end
    end
  end
end
