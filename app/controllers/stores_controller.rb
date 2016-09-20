class StoresController < ApplicationController
  def show
    @id = params[:id]
    #make a service to look up location by ID
    #find correct information to display.
  end
end
