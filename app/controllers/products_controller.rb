class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(:sold => false )
  end
  # This is to render the current user's claimed products page (claimeditems)
  # GET/products(conditions=> sold : true, current_bidder : current_user)
  def claimeditems
    @products = Product.where(:sold => true,:current_bidder => current_user.name)
  end

  # The products that current user sold
  # GET/sold products
  def my_sold_products
    @products = Product.where(:user_id => current_user,:sold => true)
  end

  # All the products that current user has put up for sale/auction
  # GET/ products up for sale
  def my_products
    @products = Product.where(:user_id => current_user,:sold => false)
  end

  # All unsold products
  # GET
  def unsold
    @products = Product.where(:sold => false, :current_bid => 0)
  end

  #This renders all unsold products in which the current user is the highest bidder
  # Request:GET
  def mybids
    @products = Product.where(:current_bidder => current_user.name,:sold => false)
  end

  #Products claimed
  # Request:GET/all sold/claimed products
  def otherclaims
    @products = Product.where(:sold => true)
  end

  #Site navigation page
  # GET Request
  def webnav
  end


  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Product No.",
               template: "products/show.pdf.erb",
               layout: "pdf.html"
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # Bid Action: When you hit submit in the bidding form after entering bidding amount, it updates corresponding fields in DB
  #GET and PUT
  def bidding
    @product = Product.find(params[:id])
    @product.update_attributes(current_bidder: current_user.name)
    @product.update_attributes(current_bid: params[:bidding][:current_bid])
    redirect_to products_path
  end

  # Claim Action: When you hit button claim(updates soldto and sold fields correspondingly)
  #Request: PUT
  def claim
    @product = Product.find(params[:id])
    @product.update_attributes(soldto: current_user.name)
    @product.update_attributes(sold: true )
    redirect_to products_path
  end

  # To go to bid page/ bid form
  # GET
  def bid
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.contact = current_user.phone

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
      params.require(:product).permit(:name, :description, :start_bid, :deadline, :contact, :image, :current_bid, :current_bidder, :sold)
    end
end
