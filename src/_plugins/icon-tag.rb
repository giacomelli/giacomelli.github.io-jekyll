module Jekyll
  class IconTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      @iconFile = text
    end

    def render(context)      
      site = context.registers[:site]
      "<img class='lazy icon' src='#{site.baseurl}/assets/logos/#{@iconFile}' style='max-height:200px'>"
    end
  end
end

Liquid::Template.register_tag('icon', Jekyll::IconTag)