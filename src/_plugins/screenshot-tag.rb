module Jekyll
  class ScreenshotTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      unless @text.include? "/"
        galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
        @text = "#{galleryDir}/#{@text}"
      end

      site = context.registers[:site]
      "<center>
        <img class='lazy' src='#{site.baseurl}/assets/#{@text}'>
      </center>"
    end
  end
end

Liquid::Template.register_tag('screenshot', Jekyll::ScreenshotTag)