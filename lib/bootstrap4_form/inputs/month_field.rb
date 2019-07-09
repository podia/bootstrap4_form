# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module MonthField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :month_field
      end
    end
  end
end
