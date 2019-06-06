module Jekyll
  class GalleryTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      Helper::include(context, "gallery.html")
    end
  end
end

Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)