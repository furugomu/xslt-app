class UnkosController < ApplicationController
  def index
    @unkos = Unko.order(:id).reverse_order.limit(100)
  end

  def show
    @unko = Unko.find(params[:id])
  end
end
