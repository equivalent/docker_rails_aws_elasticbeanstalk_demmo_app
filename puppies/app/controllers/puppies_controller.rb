class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all
  end

  def like
    puppy = Puppy.find(params[:id])
    IncreaseLikeCounterJob.perform_later(resource_class: puppy.class.name, resource_id: puppy.id)
    flash[:notice] = "Your like was accepted"
    redirect_to root_path
  end
end
