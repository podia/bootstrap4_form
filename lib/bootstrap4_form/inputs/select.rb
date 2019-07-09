# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module Select
      extend ActiveSupport::Concern
      include Base

      included do
        def select_with_bootstrap(method, choices=nil, options={}, html_options={}, &block)
          form_group_builder(method, options, html_options) do
            prepend_and_append_input(method, options) do
              select_without_bootstrap(method, choices, options, html_options, &block)
            end
          end
        end

        bootstrap4_alias :select
      end
    end
  end
end
