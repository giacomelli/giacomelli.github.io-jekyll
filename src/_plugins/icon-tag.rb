module Jekyll
  class IconTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      @iconFile = text
    end

    def render(context)      
      site = context.registers[:site]
      "<center>
      <img class='lazy' src='#{site.baseurl}/assets/logos/#{@iconFile}' style='max-height:200px'>
      </center>"

    end
  end
end

Liquid::Template.register_tag('icon', Jekyll::IconTag)