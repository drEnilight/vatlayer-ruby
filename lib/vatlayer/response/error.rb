# frozen_string_literal: true

module Vatlayer
  module Response
    class Error
      def initialize(attributes)
        attributes.each do |(key, value)|
          self.class.class_eval { attr_accessor :"#{key}" }
          public_send("#{key}=", value)
        end
      end
    end
  end
end
