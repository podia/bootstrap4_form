# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module TelephoneField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :telephone_field
      end
    end
  end
end
