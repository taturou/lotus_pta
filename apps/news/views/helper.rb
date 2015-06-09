module News::View
  def initialize
    super
  end

  # i18n
  def t(*args)
    I18n.t *args
  end
end

module Lotus
  module View
    module Rendering
      class TemplatesFinder
        def find
          Dir.glob( "#{ [root, recursive, template_name].join(separator) }{,#{locale}}.#{ format }.#{ engines }" ).map do |template|
            View::Template.new template
          end
        end

        def locale
          "-#{I18n.locale}"
        end
      end
    end
  end
end
