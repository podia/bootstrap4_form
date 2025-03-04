# frozen_string_literal: true

module Bootstrap4Form
  module ActionViewExtensions
    # This module creates Bootstrap4Form wrappers around the default form_with
    # and form_for methods
    #
    # Example:
    #
    #   bootstrap4_form_for @user do |f|
    #     f.text_field :name
    #   end
    #
    # Example:
    #
    #   bootstrap4_form_with model: @user do |f|
    #     f.text_field :name
    #   end
    module FormHelper
      def bootstrap4_form_for(record, options={}, &block)
        options.reverse_merge!(builder: Bootstrap4Form::FormBuilder)

        options = process_options(options)

        with_bootstrap4_form_field_error_proc do
          form_for(record, options, &block)
        end
      end

      def bootstrap4_form_with(options={}, &block)
        options.reverse_merge!(builder: Bootstrap4Form::FormBuilder)

        options = process_options(options)

        with_bootstrap4_form_field_error_proc do
          form_with(options, &block)
        end
      end

      def bootstrap4_form_tag(options={}, &block)
        options[:acts_like_form_tag] = true

        bootstrap4_form_for("", options, &block)
      end

      private

      def process_options(options)
        options[:html] ||= {}
        options[:html][:role] ||= "form"

        options[:layout] == :inline &&
          options[:html][:class] = [options[:html][:class], "form-inline"].compact.join(" ")

        options
      end

      def with_bootstrap4_form_field_error_proc
        original_proc = ActionView::Base.field_error_proc
        ActionView::Base.field_error_proc = Bootstrap4Form.field_error_proc
        yield
      ensure
        ActionView::Base.field_error_proc = original_proc
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include Bootstrap4Form::ActionViewExtensions::FormHelper
end
