# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module TimeSelect
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_select_group :time_select
      end
    end
  end
end
