class SearchController < ApplicationController
  def new
  end

  def search_result
    @adviers = Adviser.search(params[:gender], params[:region], params[:extent], 
                   params[:communicatable], params[:intervention], params[:span])
    render 'advisers/index'
  end
end
