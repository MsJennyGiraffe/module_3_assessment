class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head 204
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
