class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  def index
    @product = Product.all
  end
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to @product
  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product  = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    unless !params['pic'].to_s.blank?
      @product.update(:category => params['category'])
      @product.update(:name => params['name'])
      @product.update(:price => params['price'])
    else
      @product.update(product_params)
    end
    redirect_to @product
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  private
  def product_params
    cat = params['category'];
    nam = params['name'];
    price = params['price'];
    params = ActionController::Parameters.new({ product: { category:cat , name: nam , pic: upload , price: price}})
    params.require(:product).permit(:category,:name, :pic,:price)
  end
  private
  def upload
    uploaded_io = params['pic']
    File.open(Rails.root.join('app','assets','images', uploaded_io.original_filename),'wb') do |file|
      file.write(uploaded_io.read)
    end
    return uploaded_io.original_filename;
  end
end
