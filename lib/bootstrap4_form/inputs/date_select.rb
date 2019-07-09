# frozen_string_literal: true

module Bootstrap4Form
  module Inputs
    module DateSelect
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap4_select_group :date_select
      end
    end
  end
end
