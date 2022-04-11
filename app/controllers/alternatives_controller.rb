class AlternativesController < ApplicationController
  before_action :set_alternative, only: [:show, :edit, :update, :destroy]

  # GET /alternatives
  # GET /alternatives.json
  def index
    redirect_cannotManage(@alternatives, '/')
    @alternatives = Alternative.order("created_at DESC").all
    add_breadcrumb 'Les alternatives'
  end

  # GET /alternatives/1
  # GET /alternatives/1.json
  def show
    redirect_cannotManage(@alternatives, @alternative.product)
    @product = @alternative.product
    @category = @product.category
    add_breadcrumb 'Les alternatives', alternatives_path
    add_breadcrumb @alternative
  end

  # GET /alternatives/new
  def new
    redirect_cannotManage(@alternatives)
    @alternative = Alternative.new
    add_breadcrumb 'Les alternatives', alternatives_path
    add_breadcrumb 'Ajoute une alternative'
  end

  # GET /alternatives/1/edit
  def edit
    redirect_cannotManage(@alternatives)
    @product = @alternative.product
    @category = @product.category
    add_breadcrumb 'Les alternatives', alternatives_path
    add_breadcrumb 'Modifie une alternative'
  end

  # POST /alternatives
  # POST /alternatives.json
  def create
    add_breadcrumb 'Les alternatives', alternatives_path
    add_breadcrumb 'Ajoute une alternative'
    redirect_cannotManage(@alternatives)
    @alternative = Alternative.new(alternative_params)

    respond_to do |format|
      if @alternative.save
        format.html { redirect_to @alternative, notice: 'Alternative was successfully created.' }
        format.json { render :show, status: :created, location: @alternative }
      else
        format.html { render :new }
        format.json { render json: @alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alternatives/1
  # PATCH/PUT /alternatives/1.json
  def update
    redirect_cannotManage(@alternatives)
    respond_to do |format|
      if @alternative.update(alternative_params)
        format.html { redirect_to @alternative, notice: 'Alternative was successfully updated.' }
        format.json { render :show, status: :ok, location: @alternative }
      else
        format.html { render :edit }
        format.json { render json: @alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternatives/1
  # DELETE /alternatives/1.json
  def destroy
    redirect_cannotManage(@alternatives)
    @alternative.destroy
    respond_to do |format|
      format.html { redirect_to alternatives_url, notice: 'Alternative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternative
      @alternative = Alternative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alternative_params
      params.require(:alternative).permit(:product_id, :title, :description, :find, :source, :imgUrl, :alternative_type_filter_id, :image)
    end
end
