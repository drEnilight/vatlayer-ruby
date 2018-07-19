# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Api do
  describe '#price' do
    let(:instance) { Vatlayer.new() }

    before { allow(instance).to receive(:price).and_return(result) }

    subject { instance.price(amount: 100, country_code: 'GB', options: { type: 'medical' }) }

    context 'with valid access_key' do
      let(:result) { Vatlayer::Response::Data.new(response) }
      let(:response) { Hash['success', true, 'country_code', 'GB', 'country_name', 'United Kingdom',
                            'price_excl_vat', 100, 'price_incl_vat', 100, 'type', 'medical', 'vat_rate', 0] }

      it 'returns object with expected attributes' do
        is_expected.to have_attributes(success: true, country_code: 'GB', country_name: 'United Kingdom',
                                       price_excl_vat: 100, price_incl_vat: 100, type: 'medical', vat_rate: 0)
      end
    end
  end
end
