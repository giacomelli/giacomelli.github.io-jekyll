module Jekyll
  module CustomFilters
    def galleryname(input)
      GalleryGenerator::getGalleryName(input)
    end

    def categorytitle(input)
      sanitizedTitle = input.gsub /[\[\]"]/, '';

      case sanitizedTitle 
      when 'Article'
        return 'Articles'
      when 'Tutorial'
        return 'Tutorials'  
      when 'Lab'
        return 'Labs'     
      else
        return sanitizedTitle
      end
    end

    def categoryicon(input)
      case input.gsub /[\[\]"]/, ''
      when 'News'
        iconName = 'newspaper'
      when 'Lab'
        iconName = 'eye'
      when 'Game'
        iconName = 'gamepad'
      when 'Article'
        iconName = 'comments'
      when 'Tutorial'
        iconName = 'chalkboard-teacher'
      when 'Column'
        iconName = 'comment-alt'
      when 'Promo'
        iconName = 'money-bill-alt'
      end
      
      return "<i class='fas fa-#{iconName}'></i>"
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::CustomFilters)