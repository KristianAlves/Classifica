class Site::CartController < SiteController
  before_action :set_cart, only:[:edit, :update, :destroy]


  def index
   @categories = Category.order_by_description
   @ads = Ad.where(member: current_member)
   @carts = Cart.where(buyer: current_member)
   @sum_of_products = @carts.total
   @item_of_cart = @carts.item
  end

  def create
    ad = Ad.find(params[:ad_id])
    @cart = Cart.create(ad_id: ad.id, buyer_id: current_member.id, description_id: ad.title, amount: ad.price)
    redirect_to site_cart_index_path
  end

  def destroy
    if @cart.destroy
        redirect_to site_cart_index_path, notice: ("Item excluído com sucesso")
    else
      render :index
    end
  end

  def set_cart
      @cart = Cart.find(params[:id])
  end

end
