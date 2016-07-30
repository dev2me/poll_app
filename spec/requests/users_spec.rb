require 'rails_helper'
RSpec.describe Api::V1::UsersController, type: :request do
	describe "POST /users" do
		#callback que ejecuta el código del bloque antes de que se validen los test
		before :each do
			auth = { provider: "facebook", uid: "adfa3saes3a", info: {email: "jesus@gruvel.com"}}
			post "/api/v1/users", params:{auth: auth}
		end

		it { have_http_status(200) }
		it { change(User, :count).by(1) }

		it "responde with the user found or created" do
			json = JSON.parse(response.body)
			expect(json["email"]).to eq("jesus@gruvel.com")
		end
	end
end