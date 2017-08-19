class ExtentsController < ApplicationController
  before_action :set_extent, only: [:show, :edit, :update, :destroy]

  # GET /extents
  # GET /extents.json
  def index
    @extents = Extent.all
  end

  # GET /extents/1
  # GET /extents/1.json
  def show
  end

  # GET /extents/new
  def new
    @extent = Extent.new
  end

  # GET /extents/1/edit
  def edit
  end

  # POST /extents
  # POST /extents.json
  def create
    @extent = Extent.new(extent_params)

    respond_to do |format|
      if @extent.save
        format.html { redirect_to @extent, notice: 'Extent was successfully created.' }
        format.json { render :show, status: :created, location: @extent }
      else
        format.html { render :new }
        format.json { render json: @extent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extents/1
  # PATCH/PUT /extents/1.json
  def update
    respond_to do |format|
      if @extent.update(extent_params)
        format.html { redirect_to @extent, notice: 'Extent was successfully updated.' }
        format.json { render :show, status: :ok, location: @extent }
      else
        format.html { render :edit }
        format.json { render json: @extent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extents/1
  # DELETE /extents/1.json
  def destroy
    @extent.destroy
    respond_to do |format|
      format.html { redirect_to extents_url, notice: 'Extent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extent
      @extent = Extent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extent_params
      params.require(:extent).permit(:name)
    end
end
