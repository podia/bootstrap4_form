# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module TimeField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :time_field
      end
    end
  end
end
