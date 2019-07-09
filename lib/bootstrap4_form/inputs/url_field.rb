# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module UrlField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :url_field
      end
    end
  end
end
