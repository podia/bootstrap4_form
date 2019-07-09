# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module DateField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :date_field
      end
    end
  end
end
