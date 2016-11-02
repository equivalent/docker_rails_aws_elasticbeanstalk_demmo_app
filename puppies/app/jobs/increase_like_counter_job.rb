class IncreaseLikeCounterJob < ApplicationJob
  queue_as :default

  def perform(resource_class:, resource_id:)
    resource_class
      .constantize
      .find(resource_id)
      .increment(:like_counter, 1)
      .save
  end
end
