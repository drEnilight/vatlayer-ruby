# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Response::Data do
  describe '#new' do
    subject { described_class.new(response) }

    context 'with common validate response' do
      let(:response) { Hash['valid', true, 'database', 'ok', 'format_valid', true, 'query', 'LU26375245',
                            'country_code', 'LU', 'vat_number', '26375245', 'company_name', 'AMAZON EUROPE CORE S.A R.L.',
                            'company_address', '5, RUE PLAETIS L-2338  LUXEMBOURG'] }

       it 'returns object with expected attributes' do
         is_expected.to have_attributes(valid: true)
         is_expected.to have_attributes(database: 'ok')
         is_expected.to have_attributes(format_valid: true)
         is_expected.to have_attributes(query: 'LU26375245')
         is_expected.to have_attributes(country_code: 'LU')
         is_expected.to have_attributes(company_name: 'AMAZON EUROPE CORE S.A R.L.')
         is_expected.to have_attributes(company_address: '5, RUE PLAETIS L-2338  LUXEMBOURG')
       end

       context 'without errors' do
         it { is_expected.to have_attributes(error: nil) }
       end
    end

    context 'with common rate_list response' do
      let(:response) { Hash['success', true, 'rates', rates] }
      let(:rates) { Hash['AT', rate, 'BE', rate ] }
      let(:rates) { Hash['country_name', 'Austria', 'standard_rate', 20, 'reduced_rates', reduced_rates] }
      let(:reduced_rates) { Hash['foodstuffs', 10, 'books', 10, 'pharmaceuticals', 10, 'passenger transport', 10,
                                 'newspapers', 10, 'admission to cultural events', 10,
                                 'hotels', 10, 'admission to entertainment events', 10] }

      it 'returns object with expected attributes' do
        # todo
      end
    end

    context 'with error response' do
      let(:error) { Hash['code', 101, 'type', 'invalid_access_key',
                         'info', 'You have not supplied a valid API Access Key. [Technical Support: support@apilayer.com]' ] }
      let(:response) { Hash['success', false,
                            'error', error] }

      it 'returns object with present errors' do
        is_expected.to have_attributes(success: false)
        expect(subject.error).to have_attributes(code: 101, type: 'invalid_access_key',
                                                 info: 'You have not supplied a valid API Access Key. [Technical Support: support@apilayer.com]')
      end
    end
  end
end
