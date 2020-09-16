module Jekyll
  class ImagesTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      parts = text.split(' ')
      @image = parts[0]
      @className = parts[1]
    end

    def render(context)                    
        Helper::picture(context, @image, @className)
    end
  end
end

Liquid::Template.register_tag('images', Jekyll::ImagesTag)