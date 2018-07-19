# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Api do
  describe '#rate' do
    let(:instance) { Vatlayer.new() }

    before { allow(instance).to receive(:rate).and_return(result) }

    subject { instance.rate(amount: 100, country_code: 'GB') }

    context 'with valid access_key' do
      let(:result) { Vatlayer::Response::Data.new(response) }
      let(:response) { Hash['success', true, 'country_code', 'GB', 'country_name', 'United Kingdom',
                            'standard_rate', 20, 'reduced_rates', reduced_rates] }
      let(:reduced_rates) { Hash['property_renovations', 5, 'foodstuffs', 0, 'books', 0, 'pharmaceuticals', 0,
                                 'medical', 0, 'passenger_transport', 0, 'newspapers', 0, 'childrens_clothing', 0] }

      it 'returns object with expected attributes' do
        is_expected.to have_attributes(success: true, country_code: 'GB', country_name: 'United Kingdom',
                                       standard_rate: 20)
      end

      it 'returns reduced_rates attributes' do
        expect(subject.reduced_rates).to have_attributes(property_renovations: 5, foodstuffs: 0, books: 0, pharmaceuticals: 0,
                                                         medical: 0, passenger_transport: 0, newspapers: 0, childrens_clothing: 0)
      end
    end
  end
end
