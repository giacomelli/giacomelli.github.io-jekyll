module Jekyll
  class NoteTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<div class='note'>#{Helper::toMarkdown(context, @text)}</div>"
    end
  end
end

Liquid::Template.register_tag('note', Jekyll::NoteTag)