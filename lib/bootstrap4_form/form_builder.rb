# require 'bootstrap4_form/aliasing'

module Bootstrap4Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :layout, :label_col, :control_col, :has_error, :inline_errors,
                :label_errors, :acts_like_form_tag

    include Bootstrap4Form::Helpers::Bootstrap

    include Bootstrap4Form::FormGroupBuilder
    include Bootstrap4Form::FormGroup
    include Bootstrap4Form::Components

    include Bootstrap4Form::Inputs::Base
    include Bootstrap4Form::Inputs::CheckBox
    include Bootstrap4Form::Inputs::CollectionCheckBoxes
    include Bootstrap4Form::Inputs::CollectionRadioButtons
    include Bootstrap4Form::Inputs::CollectionSelect
    include Bootstrap4Form::Inputs::ColorField
    include Bootstrap4Form::Inputs::DateField
    include Bootstrap4Form::Inputs::DateSelect
    include Bootstrap4Form::Inputs::DatetimeField
    include Bootstrap4Form::Inputs::DatetimeLocalField
    include Bootstrap4Form::Inputs::DatetimeSelect
    include Bootstrap4Form::Inputs::EmailField
    include Bootstrap4Form::Inputs::FileField
    include Bootstrap4Form::Inputs::GroupedCollectionSelect
    include Bootstrap4Form::Inputs::MonthField
    include Bootstrap4Form::Inputs::NumberField
    include Bootstrap4Form::Inputs::PasswordField
    include Bootstrap4Form::Inputs::PhoneField
    include Bootstrap4Form::Inputs::RadioButton
    include Bootstrap4Form::Inputs::RangeField
    include Bootstrap4Form::Inputs::RichTextArea if Rails::VERSION::MAJOR >= 6
    include Bootstrap4Form::Inputs::SearchField
    include Bootstrap4Form::Inputs::Select
    include Bootstrap4Form::Inputs::TelephoneField
    include Bootstrap4Form::Inputs::TextArea
    include Bootstrap4Form::Inputs::TextField
    include Bootstrap4Form::Inputs::TimeField
    include Bootstrap4Form::Inputs::TimeSelect
    include Bootstrap4Form::Inputs::TimeZoneSelect
    include Bootstrap4Form::Inputs::UrlField
    include Bootstrap4Form::Inputs::WeekField

    delegate :content_tag, :capture, :concat, to: :@template

    def initialize(object_name, object, template, options)
      @layout = options[:layout]
      @label_col = options[:label_col] || default_label_col
      @control_col = options[:control_col] || default_control_col
      @label_errors = options[:label_errors] || false

      @inline_errors = if options[:inline_errors].nil?
                         @label_errors != true
                       else
                         options[:inline_errors] != false
                       end
      @acts_like_form_tag = options[:acts_like_form_tag]
      super
    end

    def fields_for_with_bootstrap(record_name, record_object=nil, fields_options={}, &block)
      fields_options = fields_for_options(record_object, fields_options)
      record_object.is_a?(Hash) && record_object.extractable_options? &&
        record_object = nil
      fields_for_without_bootstrap(record_name, record_object, fields_options, &block)
    end

    bootstrap4_alias :fields_for

    # the Rails `fields` method passes its options
    # to the builder, so there is no need to write a `bootstrap4_form` helper
    # for the `fields` method.

    private

    def fields_for_options(record_object, fields_options)
      field_options = fields_options
      record_object.is_a?(Hash) && record_object.extractable_options? &&
        field_options = record_object
      %i[layout control_col inline_errors label_errors].each do |option|
        field_options[option] ||= options[option]
      end
      field_options[:label_col] = field_options[:label_col].present? ? (field_options[:label_col]).to_s : options[:label_col]
      field_options
    end

    def default_label_col
      "col-sm-2"
    end

    def offset_col(label_col)
      label_col.gsub(/\bcol-(\w+)-(\d)\b/, 'offset-\1-\2')
    end

    def default_control_col
      "col-sm-10"
    end

    def hide_class
      "sr-only" # still accessible for screen readers
    end

    def control_class
      "form-control"
    end

    def feedback_class
      "has-feedback"
    end

    def control_specific_class(method)
      "rails-bootstrap-forms-#{method.to_s.tr('_', '-')}"
    end
  end
end
