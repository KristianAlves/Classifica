class Checkout::PaymentsController < ApplicationController

  # COMPRADOR DE TESTE:
  # E-mail: c50684192453901715465@sandbox.pagseguro.com.br
  # Senha: 14m19475814x4K35
  # Cartão de Crédito: 4111111111111111  / Bandeira: VISA Válido até: 12/2030 CVV: 123


  def create
    ad = Ad.find(params[:ad_id])
    ad.processing!

    order = Order.create(ad: ad, buyer_id: current_member.id)
    order.waiting!

    payment =PagSeguro::PaymentRequest.new

    payment.reference = order.id
    payment.notification_url = checkout_notifications_url
    payment.redirect_url = site_ad_detail_url(ad)

    payment.items << {
      id: ad.id,
      description: ad.title,
      amount:ad.price.to_s.gsub(',' , '.')
    }

    response = payment.register

    if response.errors.any?
      redirect_to site_ad_detail_path(ad), alert:"Erro ao processar a compra. Entre em contato com o SAC"
    else
      redirect_to response.url
    end
  end
end
