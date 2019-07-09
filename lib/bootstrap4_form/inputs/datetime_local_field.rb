# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module DatetimeLocalField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :datetime_local_field
      end
    end
  end
end
