module Jekyll
  class ExternalReferenceTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<div class='externalref'>#{Helper::toMarkdown(context, @text)}</div>"
    end
  end
end

Liquid::Template.register_tag('externalref', Jekyll::ExternalReferenceTag)