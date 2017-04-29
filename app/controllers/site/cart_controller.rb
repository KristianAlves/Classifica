class Site::CartController < SiteController
  def index
    @categories = Category.order_by_description
    @ads = Ad.where(member: current_member)
  end
end
