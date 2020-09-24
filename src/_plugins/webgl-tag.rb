module Jekyll
  class WebGLTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
     "<iframe src='/apps/#{@text}/index.html' style='width: 100%;min-height: 700px;'></iframe>"
    end
  end
end

Liquid::Template.register_tag('webgl', Jekyll::WebGLTag)