# frozen_string_literal: true

module Vatlayer
  class Response
    attr_reader :error

    def initialize(attributes)
      attributes.each do |(key, value)|
        self.class.class_eval { attr_accessor :"#{key}" }
        public_send("#{key}=", key == 'error' ? value['type'] : value)
      end
    end
  end
end
