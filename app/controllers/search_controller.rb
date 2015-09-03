class SearchController < ApplicationController
  def index
  end
  
  def search
    @menuname = params[:search]
    @menu = Menu.where(:name => params[:search]).first
    respond_to do |format|
      format.html
      format.json { render json: @menu }
    end
  end

  private
    def menu_params
      params.require(:search)
    end
end
