# frozen_string_literal: true

require 'spec_helper'

describe 'Vatlayer::Response::Data' do
  describe '#new' do
    subject { Vatlayer::Response::Data.new(response) }

    context 'with common response' do
      let(:response) { Hash['valid', true, 'database', 'ok', 'format_valid', true, 'query', 'LU26375245',
                            'country_code', 'LU', 'vat_number', '26375245', 'company_name', 'AMAZON EUROPE CORE S.A R.L.',
                            'company_address', '5, RUE PLAETIS L-2338  LUXEMBOURG'] }

       it 'returns object with expected attributes' do
         is_expected.to have_attributes(valid: true, database: 'ok', format_valid: true, query: 'LU26375245', country_code: 'LU',
                                        company_name: 'AMAZON EUROPE CORE S.A R.L.', company_address: '5, RUE PLAETIS L-2338  LUXEMBOURG')
       end

       context 'without errors' do
         it { is_expected.to have_attributes(error: nil) }
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
