# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module PhoneField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :phone_field
      end
    end
  end
end
