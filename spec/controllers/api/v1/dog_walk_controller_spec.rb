require 'rails_helper'
require 'controllers/api/v1/response_helper'

RSpec.configure do |c|
  c.include Api::V1::ResponseHelper
end

RSpec.describe Api::V1::DogWalkController, type: :controller do
  let(:params) { nil }
  let!(:dog_walks) { create_list(:dog_walk, 100) }

  describe 'GET #index' do
    before do
      get :index, params: params
    end

    context 'when it has no params' do
      it { expect(response).to have_http_status :ok }

      it 'expect to return 1st page of pagination' do
        expect(response_current_page).to eq 1
        expect(response_per_page).to eq 25
        expect(response_pagination['total']).to eq 100
        expect(response_pagination['pages']).to eq 4
        expect(response_entries.size).to eq 25
      end
    end

    context 'when it has a page param' do
      let(:params) {{ page: 3 }}

      it { expect(response).to have_http_status :ok }

      it 'expect to return the new number of itens per_page' do
        expect(response_current_page).to eq 3
        expect(response_per_page).to eq 25
        expect(response_pagination['total']).to eq 100
        expect(response_pagination['pages']).to eq 4
        expect(response_entries.size).to eq 25
      end
    end

    context 'when it has a per_page param' do
      let(:params) {{ per_page: 42 }}

      it { expect(response).to have_http_status :ok }

      it 'expect to return the new number of itens per_page' do
        expect(response_current_page).to eq 1
        expect(response_per_page).to eq 42
        expect(response_pagination['total']).to eq 100
        expect(response_pagination['pages']).to eq 3
        expect(response_entries.size).to eq 42
      end
    end

    context 'when it has an invalid param' do
      let(:params) {{ per_page: 999 }}

      it { expect(response).to have_http_status :bad_request }
      it { expect(response_messages).to eq ['Invalid param: per_page limit exceeded'] }
    end
  end
end
