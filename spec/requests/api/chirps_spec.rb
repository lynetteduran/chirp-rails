require "rails_helper"

describe "Chirp API Tests" do

  #1 tests chirps#index
  it "GET /chirps should return 200" do

    get "/chirps"

    expect(response).to have_http_status(200)

  end

  #2 tests chirps#create
  it "POST /chirps should return 201 (created)" do

    post "/chirps", params: {
      chirp: {
        chirp_text: "Hello, I'm a chirp!"
      }
    }

    expect(response).to have_http_status(201)
  end

  #3 tests chirps#edit
  it "GET /chirps/:id should return 200 (OK)" do

    chirp = Chirp.create(chirp_text: "Hello, I'm a chirp!")

    get "/chirps/#{chirp.id}/edit"

    expect(response).to have_http_status(200)
  end

  #4 tests chirps#update
  it "PUT /chirps/:id should return 204 (No Content)" do

    chirp = Chirp.create(chirp_text: "Hello, I'm a chirp!")

    put "/chirps/#{chirp.id}", params: {
      chirp: {
        chirp_text: "Hello again!"
      }
    }

    expect(response).to have_http_status(204)
  end

  #5 tests chirps#destroy
  it "DELETE /chirps/:id should return 200" do
    chirp = Chirp.create(chirp_text: "Hello, I'm a chirp!")

    delete "/chirps/#{chirp.id}"

    expect(response).to have_http_status(200)
  end

end
