class AdvisersController < ApplicationController
  before_action :set_adviser, only: [:show, :edit, :update, :destroy]

  # GET /advisers
  # GET /advisers.json
  def index
    @advisers = Adviser.all
  end

  # GET /advisers/1
  # GET /advisers/1.json
  def show
  end

  # GET /advisers/new
  def new
    @adviser = Adviser.new
  end

  # GET /advisers/1/edit
  def edit
  end

  # POST /advisers
  # POST /advisers.json
  def create
    @adviser = Adviser.new(adviser_params)

    respond_to do |format|
      if @adviser.save
        format.html { redirect_to @adviser, notice: 'Adviser was successfully created.' }
        format.json { render :show, status: :created, location: @adviser }
      else
        format.html { render :new }
        format.json { render json: @adviser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advisers/1
  # PATCH/PUT /advisers/1.json
  def update
    respond_to do |format|
      if @adviser.update(adviser_params)
        format.html { redirect_to @adviser, notice: 'Adviser was successfully updated.' }
        format.json { render :show, status: :ok, location: @adviser }
      else
        format.html { render :edit }
        format.json { render json: @adviser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advisers/1
  # DELETE /advisers/1.json
  def destroy
    @adviser.destroy
    respond_to do |format|
      format.html { redirect_to advisers_url, notice: 'Adviser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adviser
      @adviser = Adviser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adviser_params
      params.require(:adviser).permit(:name, :comment, :avator, :min_age, :max_age, :day, :start_time, :end_time)
    end
end
