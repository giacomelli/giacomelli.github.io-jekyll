module Jekyll
  class IconTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      @iconFile = text
    end

    def render(context)      
      site = context.registers[:site]
      Helper::picture(context, "#{site.baseurl}/assets/logos/#{@iconFile}", "icon");
    end
  end
end

Liquid::Template.register_tag('icon', Jekyll::IconTag)