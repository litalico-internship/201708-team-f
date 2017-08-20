class SearchController < ApplicationController
  def new
  end

  def search_result
    advier = Adviser.search(params[:gender], params[:region], params[:extent], 
                   params[:communicatable], params[:intervention], params[:span])
  end
end
