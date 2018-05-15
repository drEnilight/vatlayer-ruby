# frozen_string_literal: true

module Vatlayer
  module Response
    class Data
      attr_reader :error

      def initialize(attributes)
        attributes.each do |(key, value)|
          self.class.class_eval { attr_accessor :"#{key}" }
          generate_methods(key, value)
        end
      end

      private

      def generate_methods(key, value)
        case key
        when 'error'
          public_send("#{key}=", Vatlayer::Response::Error.new(value))
        when 'rates'
          public_send("#{key}=", Vatlayer::Response::Rates.new(value))
        else
          public_send("#{key}=", value)
        end
      end
    end
  end
end
