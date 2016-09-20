class SearchController < ApplicationController
  def index
    @stores = Store.find_by_zipcode(params[:search])
    @stores_display = @stores[0..14]
  end
end
