# frozen_string_literal: true

require 'spec_helper'

describe Configuration do
  let(:instance) { Configuration.new }

  describe '#access_key' do
    subject { instance.access_key }

    context 'with defined access_key' do
      before { instance.access_key = '1a72fb399a70f0ecdc23' }

      it 'returns defined access_key' do
        is_expected.to eq('1a72fb399a70f0ecdc23')
      end
    end

    context 'with default access_key' do
      it 'returns default access_key' do
        is_expected.to eq('Your Access key')
      end
    end
  end

  describe '#https' do
    subject { instance.https }

    context 'with defined access_key' do
      before { instance.https = true }

      it 'returns defined access_key' do
        is_expected.to be_truthy
      end
    end

    context 'with default access_key' do
      it 'returns default access_key' do
        is_expected.to be_falsey
      end
    end
  end
end
