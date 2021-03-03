class SuggestedAlternativesController < ApplicationController
  before_action :set_suggested_alternative, only: %i[ show edit update destroy ]

  # GET /suggested_alternatives or /suggested_alternatives.json
  def index
    @suggested_alternatives = SuggestedAlternative.all
  end

  # GET /suggested_alternatives/1 or /suggested_alternatives/1.json
  def show
  end

  # GET /suggested_alternatives/new
  def new
    @suggested_alternative = SuggestedAlternative.new
  end

  # GET /suggested_alternatives/1/edit
  def edit
  end

  # POST /suggested_alternatives or /suggested_alternatives.json
  def create
    @suggested_alternative = SuggestedAlternative.new(suggested_alternative_params)

    respond_to do |format|
      if @suggested_alternative.save
        format.html { redirect_to @suggested_alternative, notice: "Suggested alternative was successfully created." }
        format.json { render :show, status: :created, location: @suggested_alternative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @suggested_alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggested_alternatives/1 or /suggested_alternatives/1.json
  def update
    respond_to do |format|
      if @suggested_alternative.update(suggested_alternative_params)
        format.html { redirect_to @suggested_alternative, notice: "Suggested alternative was successfully updated." }
        format.json { render :show, status: :ok, location: @suggested_alternative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @suggested_alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_alternatives/1 or /suggested_alternatives/1.json
  def destroy
    @suggested_alternative.destroy
    respond_to do |format|
      format.html { redirect_to suggested_alternatives_url, notice: "Suggested alternative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggested_alternative
      @suggested_alternative = SuggestedAlternative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def suggested_alternative_params
      params.require(:suggested_alternative).permit(:product_id, :title, :description, :source, :find, :imgUrl, :alternative_type_filter_id)
    end
end
