class CommunicatablesController < ApplicationController
  before_action :set_communicatable, only: [:show, :edit, :update, :destroy]

  # GET /communicatables
  # GET /communicatables.json
  def index
    @communicatables = Communicatable.all
  end

  # GET /communicatables/1
  # GET /communicatables/1.json
  def show
  end

  # GET /communicatables/new
  def new
    @communicatable = Communicatable.new
  end

  # GET /communicatables/1/edit
  def edit
  end

  # POST /communicatables
  # POST /communicatables.json
  def create
    @communicatable = Communicatable.new(communicatable_params)

    respond_to do |format|
      if @communicatable.save
        format.html { redirect_to @communicatable, notice: 'Communicatable was successfully created.' }
        format.json { render :show, status: :created, location: @communicatable }
      else
        format.html { render :new }
        format.json { render json: @communicatable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communicatables/1
  # PATCH/PUT /communicatables/1.json
  def update
    respond_to do |format|
      if @communicatable.update(communicatable_params)
        format.html { redirect_to @communicatable, notice: 'Communicatable was successfully updated.' }
        format.json { render :show, status: :ok, location: @communicatable }
      else
        format.html { render :edit }
        format.json { render json: @communicatable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communicatables/1
  # DELETE /communicatables/1.json
  def destroy
    @communicatable.destroy
    respond_to do |format|
      format.html { redirect_to communicatables_url, notice: 'Communicatable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communicatable
      @communicatable = Communicatable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def communicatable_params
      params.require(:communicatable).permit(:name)
    end
end
