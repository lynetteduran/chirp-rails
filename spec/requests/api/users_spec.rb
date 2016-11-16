require "rails_helper"

describe "User API Tests" do

  #1 tests users#index
  it "GET /users should return 200 (OK)" do
    get "/users"

    expect(response).to have_http_status(200)
  end

  #2 tests users#create
  it "POST /users should return 201 (created)" do
    post "/users", params: {
      user: {
        username: "Test",
        email: "test@test.com",
        password: "test"
      }
    }

    expect(response).to have_http_status(201)
  end

  #3 tests users#create error (POST missing required attribute)
  it "POST /users missing attribute upon creation should return 400" do
    post "/users", params: {
      user: {
        username: "Test",
        email: "test@test.com",
      }
    }

    expect(response).to have_http_status(400)
  end

  #4 tests users#edit
  it "GET /users/:id/edit should return 200 (OK)" do

    user = User.create(username: "Test", email: "test@test.com", password: "test")

    get "/users/#{user.id}/edit"

    expect(response).to have_http_status(200)

  end

  #5 tests users#update
  it "PUT /users/:id should return 204 (No Content)" do

    user = User.create(username: "Test", email: "test@test.com", password: "test")

    put "/users/#{user.id}", params: {
      user: {
        username: "Testy"
      }
    }

    expect(response).to have_http_status(204)
  end

  #6 tests users#destroy
  it "DELETE /users/:id should return 200" do
    user = User.create(username: "Test", email: "test@test.com", password: "test")

    delete "/users/#{user.id}"

    expect(response).to have_http_status(200)
  end

end
