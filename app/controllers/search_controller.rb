class SearchController < ApplicationController
  def new
  end

  def search_result
    @adviers = Adviser.search(search_params)
    render 'advisers/index'
  end

  private
  def search_params
    params.permit(:gender, :region, :extent, :communicatable, :intervention, :span)
  end
end
