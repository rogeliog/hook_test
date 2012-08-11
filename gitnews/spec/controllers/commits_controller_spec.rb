require 'spec_helper'

describe CommitsController do
  let(:json) {JSON.parse "{\"commits\": [{\"message\":\"Message\",\"url\":\"some.com\",\"timestamp\":\"2012-08-10 14:34:56 -0500\",\"author\":{\"name\":\"Name\"}}]}"}

  describe '#create' do
    it 'Parses the params' do
      post :create, json
    end
    it 'Creates a commit'
  end

end
