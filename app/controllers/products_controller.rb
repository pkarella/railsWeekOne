class ProductsController < ApplicationController
  def index
    @products = Product.most_reviews
    @products = Product.search(params[:search]) unless params[:search].blank?
    @products = @products.name unless params[:name].blank?
    render :index
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end

    def edit
      @product = Product.find(params[:id])
      render :edit
    end

    def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country, :search)
  end

end
