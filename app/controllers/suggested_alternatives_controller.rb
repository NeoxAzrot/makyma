class SuggestedAlternativesController < ApplicationController
  before_action :set_suggested_alternative, only: %i[ show edit update destroy add_to_alternatives]

  def add_to_alternatives
    result = SuggestedAlternative.find( params[:id] )
    alternative = Alternative.create(result.attributes.except("id"))
    result.destroy
    redirect_to action: 'index'
  end

  # GET /suggested_alternatives or /suggested_alternatives.json
  def index
    redirect_cannotManage(@suggested_alternatives)
    @suggested_alternatives = SuggestedAlternative.all
  end

  # GET /suggested_alternatives/1 or /suggested_alternatives/1.json
  def show
    redirect_cannotManage(@suggested_alternatives)
  end

  # GET /suggested_alternatives/new
  def new
    redirect_cannotManage(@suggested_alternatives)
    @suggested_alternative = SuggestedAlternative.new
  end

  # GET /suggested_alternatives/1/edit
  def edit
    redirect_cannotManage(@suggested_alternatives)
  end

  # POST /suggested_alternatives or /suggested_alternatives.json
  def create
    redirect_cannotManage(@suggested_alternatives)
    @suggested_alternative = SuggestedAlternative.new(suggested_alternative_params)

    respond_to do |format|
      if @suggested_alternative.save

        MakymaNoticeMailer.suggested_alternative_email.deliver_later
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
    redirect_cannotManage(@suggested_alternatives)
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
    redirect_cannotManage(@suggested_alternatives)
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
