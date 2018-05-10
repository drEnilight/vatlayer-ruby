# frozen_string_literal: true

module Vatlayer
  module Response
    class Data
      attr_reader :error

      def initialize(attributes)
        attributes.each do |(key, value)|
          self.class.class_eval { attr_accessor :"#{key}" }
          public_send("#{key}=", key == 'error' ? Vatlayer::Response::Error.new(value) : value)
        end
      end
    end
  end
end
