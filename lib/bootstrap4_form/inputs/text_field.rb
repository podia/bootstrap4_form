# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module TextField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :text_field
      end
    end
  end
end
