# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module TextArea
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :text_area
      end
    end
  end
end
