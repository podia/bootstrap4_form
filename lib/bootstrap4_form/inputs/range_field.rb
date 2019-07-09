# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module RangeField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :range_field
      end
    end
  end
end
