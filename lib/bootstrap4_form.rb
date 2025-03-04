# NOTE: The rich_text_area and rich_text_area_tag helpers are defined in a file with a different
# name and not in the usual autoload-reachable way.
# The following line is definitely need to make `bootstrap4_form` work.
if ::Rails::VERSION::STRING > "6"
  require Gem::Specification.find_by_name("actiontext").gem_dir + # rubocop:disable Rails/DynamicFindBy
          "/app/helpers/action_text/tag_helper"
end
require "action_view"
require "action_pack"
require "bootstrap4_form/action_view_extensions/form_helper"

module Bootstrap4Form
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :FormBuilder
    autoload :FormGroupBuilder
    autoload :FormGroup
    autoload :Components
    autoload :Inputs
    autoload :Helpers
  end

  def self.eager_load!
    super
    Bootstrap4Form::Components.eager_load!
    Bootstrap4Form::Helpers.eager_load!
    Bootstrap4Form::Inputs.eager_load!
  end

  mattr_accessor :field_error_proc
  # rubocop:disable Style/ClassVars
  @@field_error_proc = proc do |html_tag, _instance_tag|
    html_tag
  end
  # rubocop:enable Style/ClassVars
end

require "bootstrap4_form/engine" if defined?(Rails)
