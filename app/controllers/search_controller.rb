class SearchController < ApplicationController
  protect_from_forgery except: [:new, :search_result]
  def new
  end

  def search_result
    @advisers = Adviser.search(search_params)
    @search = true
    render 'advisers/index'
  end

  private
  def search_params
    params.permit(:gender, :region, :extent, :communicatable, :intervention, :span, :age)
  end
end
