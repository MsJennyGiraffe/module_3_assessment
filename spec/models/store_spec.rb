require "rails_helper"

describe Store do
  context "find_by_zipcode" do
    it "makes stores found by zipcode" do
      VCR.use_cassette("Store model") do
        stores = Store.find_by_zipcode(80202)

        store = stores.first
        expect(store.city).to eq("Denver")
        expect(store.distance).to eq(3.25)
        expect(store.name).to eq("Cherry Creek Shopping Center")
        expect(store.phone).to eq("303-270-9189")
        expect(store.store_type).to eq("Mobile")
      end
    end
  end
end
