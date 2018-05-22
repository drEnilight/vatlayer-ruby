# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Api do
  describe '#rate_list' do
    let(:instance) { Vatlayer.new() }

    before { allow(instance).to receive(:rate_list).and_return(result) }

    subject { instance.rate_list }

    context 'with valid access_key' do
      let(:result) { Vatlayer::Response::Data.new(response) }
      let(:response) { Hash['success', true, 'rates', rates] }
      let(:rates) { Hash['at', rate, 'be', rate ] }
      let(:rate) { Hash['country_name', 'Austria', 'standard_rate', 20, 'reduced_rates', reduced_rates] }
      let(:reduced_rates) { Hash['foodstuffs', 10, 'books', 10, 'pharmaceuticals', 10, 'passenger_transport', 10,
                                 'newspapers', 10, 'admission_to_cultural_events', 10,
                                 'hotels', 10, 'admission_to_entertainment_events', 10] }

      it 'returns object with expected attributes' do
        is_expected.to have_attributes(success: true)
      end

      it 'returns rates attributes' do
        expect(subject.rates.at).to have_attributes(country_name: 'Austria')
      end

      it 'returns reduced_rates attributes' do
        expect(subject.rates.at.reduced_rates).to have_attributes(admission_to_cultural_events: 10, admission_to_entertainment_events: 10,
                                                                   books: 10, foodstuffs: 10, hotels: 10, newspapers: 10, passenger_transport: 10,
                                                                   pharmaceuticals: 10)
      end
    end
  end
end
