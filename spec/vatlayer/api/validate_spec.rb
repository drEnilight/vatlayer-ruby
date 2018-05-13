# frozen_string_literal: true

require 'spec_helper'

describe Vatlayer::Api do
  describe '#validate' do
    let(:instance) { Vatlayer.new(access_key) }

    before { allow(instance).to receive(:validate).and_return(result) }

    subject { instance.validate(vat_number: 'LU26375245') }

    context 'with valid access_key' do
      let(:access_key) { '9deff624ebf413677b8599f7f6a3df00' }
      let(:result) { Vatlayer::Response::Data.new(response) }
      let(:response) { Hash['valid', true, 'database', 'ok', 'format_valid', true, 'query', 'LU26375245',
                            'country_code', 'LU', 'vat_number', '26375245', 'company_name', 'AMAZON EUROPE CORE S.A R.L.',
                            'company_address', '5, RUE PLAETIS L-2338  LUXEMBOURG'] }

      it 'returns correct data type' do
        is_expected.to be_a(Vatlayer::Response::Data)
      end

      it 'returns valid hash keys' do
        is_expected.to have_attributes(valid: true, database: 'ok', format_valid: true, query: 'LU26375245',
                                       country_code: 'LU', vat_number: '26375245', company_name: 'AMAZON EUROPE CORE S.A R.L.',
                                       company_address: '5, RUE PLAETIS L-2338  LUXEMBOURG')
      end
    end
  end
end
