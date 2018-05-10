# frozen_string_literal: true

module Vatlayer
  class Response
    def initialize(attributes)
      attributes.each do |(key, value)|
        self.class.class_eval { attr_accessor :"#{key}" }
        public_send("#{key}=", key == 'error' ? value['type'] : value)
      end
    end

    def error
      @error
    end
  end
end
