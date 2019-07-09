# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module WeekField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :week_field
      end
    end
  end
end
