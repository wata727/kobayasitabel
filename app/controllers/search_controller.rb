class SearchController < ApplicationController
  def index
  end
  
  def search
    @menuname = params[:search]
    @menu = Menu.where(:name => params[:search]).first
  end

  private
    def menu_params
      params.require(:search)
    end
end
