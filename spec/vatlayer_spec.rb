# frozen_string_literal: true

require 'spec_helper'
require 'securerandom'

describe Vatlayer do
  describe '.configure' do
    context 'with defined access_key' do
      let(:secret_key) { SecureRandom.hex(10) }
      before { described_class.configure { |config| config.access_key = secret_key } }

      it 'returns an array with 10 elements' do
        expect(draw).to be_a(Array)
        expect(draw.size).to eq(10)
      end
    end
  end
end
