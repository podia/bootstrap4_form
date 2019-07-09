# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module NumberField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :number_field
      end
    end
  end
end
