class DeleteCacheController < ApplicationController
  def index
    Rails.cache.clear
    redirect_to root_path, :notice => "Cache cleared"
  end
end
