class Site::Profile::DashboardController < Site::ProfileController
   def index
  @item_member = Cart.where(buyer: current_member)
  @carts_itens = @item_member.count

  if @item_member.count >= 2
    @name_item = "Você possui #{@carts_itens} itens no carrinho"
  elsif @item_member.count == 1
    @name_item = "Você possui #{@carts_itens} item no carrinho"
  else
    @name_item = "Você não possui itens no carrinho"
  end

  end
end
