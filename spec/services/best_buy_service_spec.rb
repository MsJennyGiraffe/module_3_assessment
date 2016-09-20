require 'rails_helper'

describe BestBuyService do
  context "get_by_zipcode" do
    it "returns a list of locations by zipcode" do
      VCR.use_cassette("locations") do
        service = BestBuyService.new

        locations = service.get_by_zipcode(80202)
        location = locations.first

        expect(location["city"]).to eq("Denver")
        expect(location["distance"]).to eq(3.25)
        expect(location["name"]).to eq("Cherry Creek Shopping Center")
        expect(location["phone"]).to eq("303-270-9189")
        expect(location["storeType"]).to eq("Mobile")
      end
    end
  end
end
