# frozen_string_literal: true

module Desfake
  class ItinerariesController < Decidim::ApplicationController
    def index
      @itineraries = Desfake::Itinerary.published
    end

    def show
      @itinerary = Desfake::Itinerary.find(params[:id])
    end
  end
end
