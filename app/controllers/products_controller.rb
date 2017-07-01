class ProductsController < ApplicationController
  def index
    @products = Product.all
    @most_reviews = Product.most_reviews
    @three_most_recent = Product.three_most_recent
  end


  def show
    @products = Product.all
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
    params.require(:product).permit(:name, :cost, :country)
  end

end
