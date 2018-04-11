require 'spec_helper'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the Homepage' do 
      get '/'
      expect(last_response.status).to eq(200)
    end
  end
  
end 
        