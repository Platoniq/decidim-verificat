# frozen_string_literal: true

module Desfake
  class Itinerary < ApplicationRecord
    self.table_name = :desfake_itineraries

    include Decidim::Traceable
    include Decidim::HasUploadValidations
    include Decidim::TranslatableResource

    translatable_fields :title, :subtitle, :description

    belongs_to :organization,
               foreign_key: "decidim_organization_id",
               class_name: "Decidim::Organization"

    has_and_belongs_to_many :participatory_processes,
                            class_name: "Decidim::ParticipatoryProcess",
                            join_table: "decidim_participatory_process_desfake_itineraries",
                            foreign_key: "desfake_itinerary_id",
                            association_foreign_key: "decidim_participatory_process_id"

    has_one_attached :hero_image
    validates_upload :hero_image, uploader: Decidim::HeroImageUploader
  end
end
