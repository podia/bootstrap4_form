# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module PasswordField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :password_field
      end
    end
  end
end
