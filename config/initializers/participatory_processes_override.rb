# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::ParticipatoryProcess.class_eval do
    default_scope { order(weight: :asc) }
  end
end
