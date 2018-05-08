# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Api do
  describe '#validate' do
    let(:instance) { Vatlayer.new(access_key) }

    before { allow(instance).to receive(:validate).and_return(result) }

    subject { instance.validate('LU26375245') }

    context 'with valid access_key' do
      let(:access_key) { '9deff624ebf413677b8599f7f6a3df00' }
      let(:result) { Hash['valid', true,
                          'database', 'ok',
                          'format_valid', true,
                          'query', 'LU26375245',
                          'country_code', 'LU',
                          'vat_number', '26375245',
                          'company_name', 'AMAZON EUROPE CORE S.A R.L.',
                          'company_address', '5, RUE PLAETIS L-2338  LUXEMBOURG'] }

      it 'returns correct data type' do
        is_expected.to be_a(Hash)
      end

      it 'returns valid hash keys' do
        is_expected.to include('valid', 'database', 'format_valid', 'query', 'country_code',
                               'vat_number', 'company_name', 'company_address')
      end
    end

    context 'with invalid access_key' do
      let(:access_key) { 'invalid_key' }
      let(:error) { Hash['code', 101,
                         'type', 'invalid_access_key',
                         'info', 'You have not supplied a valid API Access Key. [Technical Support: support@apilayer.com]' ] }
      let(:result) { Hash['success', false,
                          'error', error] }

      it 'returns false status' do
        is_expected.to include('success' => false)
      end

      it 'returns error message and invalid code' do
        is_expected.to include('error' => hash_including('type' => 'invalid_access_key'))
        is_expected.to include('error' => hash_including('code' => 101))
      end
    end
  end
end
