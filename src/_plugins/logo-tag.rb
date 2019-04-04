module Jekyll
  class LogoTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      super
      parts = text.split(' ')
      @logoFile = parts[0]

      if parts.size > 1 && parts[1] == 'default'             
        @isDefault = true
      else
        @isDefault = false;
      end
    end

    def render(context)
      if @isDefault
        galleryDir = 'logos'
      else
        galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])        
      end

      site = context.registers[:site]
      "<center>
      <img class='lazy' src='#{site.baseurl}/assets/#{galleryDir}/#{@logoFile}'>
      </center>"
    end
  end
end

Liquid::Template.register_tag('logo', Jekyll::LogoTag)