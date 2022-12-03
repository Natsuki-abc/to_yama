require 'rails_helper'

RSpec.describe 'Home', type: :request do
  it 'statusが200であること' do
    get root_path
    expect(response).to have_http_status(200)
  end
end
