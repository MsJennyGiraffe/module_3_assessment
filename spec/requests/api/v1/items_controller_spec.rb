require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :request do
  describe "GET#index" do
    it "it gets all the items" do

      item_one = Item.create(
        name: "item_one",
        description: "desciption_one",
        image_url: "test_one.gif"
      )

      item_two = Item.create(
        name: "item_two",
        description: "desciption_two",
        image_url: "test_two.gif"
      )

      item_three = Item.create(
        name: "item_three",
        description: "desciption_three",
        image_url: "test_three.gif"
      )

      get "/api/v1/items"

      expect(response.status).to eq(200)

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
      expect(item_one.name).to eq(items.first["name"])
      expect(item_three.name).to eq(items.last["name"])
      expect(item_one.id).to eq(items.first["id"])
      expect(item_three.id).to eq(items.last["id"])
      expect(item_one.description).to eq(items.first["description"])
      expect(item_three.description).to eq(items.last["description"])
      expect(item_three.image_url).to eq(items.last["image_url"])
      expect(items.first["created_at"]).to eq(nil)
    end
  end
  describe "GET#show" do
    it "it gets a single items" do

      item_one = Item.create(
        name: "item_one",
        description: "desciption_one",
        image_url: "test_one.gif"
      )

      item_two = Item.create(
        name: "item_two",
        description: "desciption_two",
        image_url: "test_two.gif"
      )

      item_three = Item.create(
        name: "item_three",
        description: "desciption_three",
        image_url: "test_three.gif"
      )

      get "/api/v1/items/3"

      expect(response.status).to eq(200)

      item = JSON.parse(response.body)

      expect(item_three.name).to eq(item["name"])
      expect(item_three.id).to eq(item["id"])
      expect(item_three.description).to eq(item["description"])
      expect(item_three.image_url).to eq(item["image_url"])
      expect(item["created_at"]).to eq(nil)
    end
  end
end
