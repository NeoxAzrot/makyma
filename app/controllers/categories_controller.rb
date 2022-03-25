class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @filter = params[:filter]
    if @filter.nil?
      @params = nil
    else
      @params = @filter.parameterize.split('-')
    end

    @categories = Category.all
    @products = Product.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    add_breadcrumb @category
  end

  # GET /categories/new
  def new
    redirect_cannotManage(@categories)
    @category = Category.new
    add_breadcrumb 'Ajoute une catégorie'
  end

  # GET /categories/1/edit
  def edit
    redirect_cannotManage(@categories)
    add_breadcrumb @category, @category
    add_breadcrumb 'Modifie une catégorie'
  end

  # POST /categories
  # POST /categories.json
  def create
    add_breadcrumb 'Ajoute une catégorie'
    redirect_cannotManage(@categories)
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    redirect_cannotManage(@categories)
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    redirect_cannotManage(@categories)

    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :description, :image)
    end
end
