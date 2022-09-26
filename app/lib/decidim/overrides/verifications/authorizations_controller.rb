# frozen_string_literal: true

module Decidim
  module Overrides
    module Verifications
      # This controller allows users to create and destroy their authorizations.
      module AuthorizationsController
        def create
          enforce_permission_to :create, :authorization, authorization: authorization

          @form = Decidim::AccessCodes::Verification::AuthorizationForm.from_params(
            params.merge(user: current_user)
          ).with_context(current_organization: current_organization)

          Decidim::AccessCodes::Verification::ConfirmUserAuthorization.call(authorization, @form, session) do
            on(:ok) do
              user_as_private_space_participant
              flash[:notice] = t("authorizations.create.success", scope: "decidim.access_codes.verification")
              redirect_to decidim_verifications.authorizations_path
            end

            on(:invalid) do
              flash.now[:alert] = t("authorizations.create.error", scope: "decidim.access_codes.verification")
              render :new
            end
          end
        end

        private

        def user_as_private_space_participant
          private_participatory_spaces = Decidim::ParticipatoryProcess.where(organization: current_organization, private_space: true)

          private_participatory_spaces.each do |private_participatory_space|
            form = Decidim::Admin::ParticipatorySpacePrivateUserForm.from_params(user_params, privatable_to: private_participatory_space)
            Decidim::Admin::CreateParticipatorySpacePrivateUser.call(form, current_user, private_participatory_space)
          end
        end

        def user_params
          {
            name: current_user.name,
            email: current_user.email
          }
        end
      end
    end
  end
end
