class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    redirect_cannotManage(@products, '/')
    add_breadcrumb 'Les produits'
    @products = Product.all
    @search = params["search"]
    if @search.present?
      @title = @search["title"]
      @products = Product.where("title ILIKE ?", "%#{@title}%")
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    add_breadcrumb @product
  end

  # GET /products/new
  def new
    redirect_cannotManage(@products)
    add_breadcrumb 'Les produits', products_path
    add_breadcrumb 'Ajoute un produit'
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    redirect_cannotManage(@products)
    add_breadcrumb 'Les produits', products_path
    add_breadcrumb 'Modifie un produit'
  end

  # POST /products
  # POST /products.json
  def create
    add_breadcrumb 'Les produits', products_path
    add_breadcrumb 'Ajoute un produit'
    redirect_cannotManage(@products)
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    redirect_cannotManage(@products)
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    redirect_cannotManage(@products)
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:category_id, :title)
    end
end
