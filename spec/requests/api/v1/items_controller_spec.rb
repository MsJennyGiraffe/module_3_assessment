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

  describe "GET#destroy" do
    it "it deletes an item" do

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

      delete "/api/v1/items/3"

      expect(response.status).to eq(204)
    end
  end

  describe "GET#create" do
    it "it creates an item" do

      post "/api/v1/items?item[name]=item&item[description]=test&item[image_url]=test.gif"

      expect(response.status).to eq(201)
    end
  end
end

# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
