require 'rails_helper'
RSpec.describe Api::V1::UsersController, type: :request do
	describe "POST /users" do
		it "it response with a 200 code" do
			post "/api/v1/users"			 
			have_http_status(200)
		end

		it "creates a new use with new data" do
			auth = { provider: "facebook", uid: "adfa3saes3a", info: {email: "jesus@gruvel.com"}}
			expect{
				post "/api/v1/users", params: {auth: auth}
			}.to change(User, :count).by(1)
		end
	end
end