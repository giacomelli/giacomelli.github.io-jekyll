module Jekyll
  class VideoTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      site = context.registers[:site]
      
      "<center><video width='640' autoplay muted loop>
          <source src='#{site.baseurl}/assets/#{galleryDir}/#{@text}' type='video/mp4'>
          Your browser does not support the video tag.
       </video></center>"
    end
  end
end

Liquid::Template.register_tag('video', Jekyll::VideoTag)