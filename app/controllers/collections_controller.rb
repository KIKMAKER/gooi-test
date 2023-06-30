class CollectionsController < ApplicationController
  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
    @subscription = Subscription.find(params[:subscription_id])
  end

  def create
    @subscription = Subscription.find(params[:subscription_id])
    @collection = Collection.new(collection_params)
    @collection.subscription = @subscription
    @collection.save

    if @collection
      redirect_to subscription_path(@subscription)
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:date, :time, :note, :bucket_quantity, :bucket_type)
  end

end
