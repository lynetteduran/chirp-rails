require "rails_helper"

describe "Chirp API Tests" do
  it "GET /chirps should return 200" do
    get "/chirps"

    expect(response).to have_http_status(200)

  end
end

