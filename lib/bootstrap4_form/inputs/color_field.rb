# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module ColorField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :color_field
      end
    end
  end
end
