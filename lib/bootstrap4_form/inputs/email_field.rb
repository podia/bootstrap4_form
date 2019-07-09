# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module EmailField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_field :email_field
      end
    end
  end
end
