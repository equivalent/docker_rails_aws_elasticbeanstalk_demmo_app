class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.ordered

    @cached_message = Rails.cache.fetch 'home-cached-message' do
      "This text is cached #{rand(1000...9999999999)}"
    end
  end

  def like
    puppy = Puppy.find(params[:id])
    IncreaseLikeCounterJob.perform_later(resource_class: puppy.class.name, resource_id: puppy.id)
    flash[:notice] = "Your like was accepted"
    redirect_to root_path
  end
end
