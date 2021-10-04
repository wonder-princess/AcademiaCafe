class ToppagesController < ApplicationController
  def index
    # @community = communities.build
    @pagy, @communities = pagy(Community.order(id: :desc))
  end

  def userpolicy
  end
end