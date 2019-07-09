# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module SearchField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :search_field
      end
    end
  end
end
