module Jekyll
  class DownloadTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      parts = text.split(' ')
      @title = parts[0]
      @asset = parts[1]
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      site = context.registers[:site]

      "<a href='#{site.baseurl}/assets/#{galleryDir}/#{@asset}'>#{@title}<a>"
    end
  end
end

Liquid::Template.register_tag('download', Jekyll::DownloadTag)