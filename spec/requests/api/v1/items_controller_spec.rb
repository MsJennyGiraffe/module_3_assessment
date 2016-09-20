require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :request do
  describe "GET#index" do
    it "it gets all items" do

      item_one   = Item.create(name: item_one)
      item_two   = Item.create(name: item_two)
      item_three = Item.create(name: item_three)

      get "/api/v1/items"

      expect(response.status).to eq(200)

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
      expect(item_one.name).to eq(items.first["name"])
      expect(item_three.name).to eq(items.last["name"])
      expect(item_one.id).to eq(items.first["id"])
      expect(item_three.id).to eq(items.last["id"])
    end
  end
end
