class SearchController < ApplicationController
  def index
    @zipcode = params[:search]
  end
end
