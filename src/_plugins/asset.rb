module Jekyll
  class AssetTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      site = context.registers[:site]

      "#{site.baseurl}/assets/#{galleryDir}/#{@text}"
    end
  end
end

Liquid::Template.register_tag('asset', Jekyll::AssetTag)