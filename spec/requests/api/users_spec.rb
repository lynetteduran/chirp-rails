require "rails_helper"

describe "User API Tests" do

  it "GET /users should return 200" do
    get "/users"

    expect(response).to have_http_status(200)
  end
end
