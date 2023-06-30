class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
    @collections = @subscription.collections
    
  end

  def tuesday
    @subscriptions = Subscription.where(collection_day: :tuesday, status: :active)
  end

  def wednesday
    @subscriptions = Subscription.where(collection_day: :wednesday, status: :active)
  end
end
