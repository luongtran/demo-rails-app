class ReviewsController < ApplicationController

  def index
  @reviews = Review.all
  
  end
  def new
    @review = Review.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    #@product = Product.find(params[:product_id])
     @review= Review.new(review_params)
     @review.save
  #  @review = product.reviews(review_params)
   # redirect_to product_path(@product)
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
  	@product = Product.find(params[:product_id])
  	@review =Product.reviews.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:author, :title,:content,:rating,:product_id)
    end
end

