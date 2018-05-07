# frozen_string_literal: true

require 'spec_helper'
require 'securerandom'

describe Vatlayer do
  describe '.configure' do
    let(:configuration) { described_class.configuration }

    before { Vatlayer.instance_variable_set :@configuration, nil }

    context 'with access_key' do
      before { described_class.configure { |config| config.access_key = 'a595997d18403d7e5022' } }

      it 'returns object with configured access_key' do
        expect(configuration.access_key).to eq('a595997d18403d7e5022')
      end

      it 'returns object with default https' do
        expect(configuration.https).to be_falsey
      end
    end

    context 'with https' do
      before { described_class.configure { |config| config.https = true } }

      it 'returns object with default access_key' do
        expect(configuration.access_key).to eq('Your Access key')
      end

      it 'returns object with default https' do
        is_expected.to be_truthy
      end
    end
  end
end
