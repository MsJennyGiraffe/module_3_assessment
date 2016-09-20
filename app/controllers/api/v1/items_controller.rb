class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all, serializer: ItemSerializer
  end
end
