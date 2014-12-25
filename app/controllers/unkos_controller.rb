class UnkosController < ApplicationController
  def index
    @unkos = Unko.order(:id).reverse_order.limit(100)
  end

  def show
    @unko = Unko.find(params[:id])
  end

  def create
    @unko = Unko.create(unko_params)
    redirect_to Unko
  end

  private

  def unko_params
    params.require(:unko).permit(:name, :greeting)
  end
end
