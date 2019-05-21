module Jekyll
  class CaptionTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<center><span style='font-style:italic; font-size:small'>#{@text}</span></center><br>"
    end
  end
end

Liquid::Template.register_tag('caption', Jekyll::CaptionTag)