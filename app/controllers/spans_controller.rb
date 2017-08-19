class SpansController < ApplicationController
  before_action :set_span, only: [:show, :edit, :update, :destroy]

  # GET /spans
  # GET /spans.json
  def index
    @spans = Span.all
  end

  # GET /spans/1
  # GET /spans/1.json
  def show
  end

  # GET /spans/new
  def new
    @span = Span.new
  end

  # GET /spans/1/edit
  def edit
  end

  # POST /spans
  # POST /spans.json
  def create
    @span = Span.new(span_params)

    respond_to do |format|
      if @span.save
        format.html { redirect_to @span, notice: 'Span was successfully created.' }
        format.json { render :show, status: :created, location: @span }
      else
        format.html { render :new }
        format.json { render json: @span.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spans/1
  # PATCH/PUT /spans/1.json
  def update
    respond_to do |format|
      if @span.update(span_params)
        format.html { redirect_to @span, notice: 'Span was successfully updated.' }
        format.json { render :show, status: :ok, location: @span }
      else
        format.html { render :edit }
        format.json { render json: @span.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spans/1
  # DELETE /spans/1.json
  def destroy
    @span.destroy
    respond_to do |format|
      format.html { redirect_to spans_url, notice: 'Span was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_span
      @span = Span.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def span_params
      params.require(:span).permit(:name)
    end
end
