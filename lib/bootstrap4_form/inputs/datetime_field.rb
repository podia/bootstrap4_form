# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module DatetimeField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :datetime_field
      end
    end
  end
end
