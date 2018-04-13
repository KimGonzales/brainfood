require 'spec_helper'

  describe 'Homepage' do
    it 'loads the Homepage' do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Welcome')
    end

  end