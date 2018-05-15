# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Api do
  describe '#rate_list' do
    let(:instance) { Vatlayer.new() }

    # before { allow(instance).to receive(:rate_list).and_return(result) }

    subject { instance.rate_list }

    context 'with valid access_key' do
      let(:result) { }

      it 'returns correct data type' do
        # is_expected.to be_a(Vatlayer::Response::Data)
      end

      it 'returns valid hash keys' do
        # todo
      end
    end
  end
end
