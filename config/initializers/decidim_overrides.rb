# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::AccessCodes::Verification::AuthorizationsController.prepend Decidim::Overrides::Verifications::AuthorizationsController
end
