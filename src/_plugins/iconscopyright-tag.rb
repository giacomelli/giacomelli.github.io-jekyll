module Jekyll
  class IconsCopyrightTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      Helper.toMarkdown(context, '<br><br><br>Icons made by [Freepik](http://www.freepik.com) and [Vignesh Oviyan](http://www.flaticon.com/authors/vignesh-oviyan) from [www.flaticon.com](http://www.flaticon.com) is licensed by [Creative Commons BY 3.0](http://creativecommons.org/licenses/by/3.0/)')
    end
  end
end

Liquid::Template.register_tag('iconscopyright', Jekyll::IconsCopyrightTag)