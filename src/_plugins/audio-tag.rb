module Jekyll
  class AudioTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      site = context.registers[:site]
      "<audio controls>
        <source src='#{site.baseurl}/assets/#{galleryDir}/#{@text}' type='audio/mp3'>
      </audio>"
    end
  end
end

Liquid::Template.register_tag('audio', Jekyll::AudioTag)