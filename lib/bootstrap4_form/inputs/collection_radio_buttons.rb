# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module CollectionRadioButtons
      extend ActiveSupport::Concern
      include Base
      include InputsCollection

      included do
        def collection_radio_buttons_with_bootstrap(*args)
          inputs_collection(*args) do |name, value, options|
            radio_button(name, value, options)
          end
        end

        bootstrap4_alias :collection_radio_buttons
      end
    end
  end
end
