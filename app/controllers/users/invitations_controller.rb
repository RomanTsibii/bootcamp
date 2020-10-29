# frozen_string_literal: true

module Users
  class InvitationsController < Devise::InvitationsController
    before_action :user_authorize, only: %i[create new]

    private

    def user_authorize
      authorize User
    end
  end
end
