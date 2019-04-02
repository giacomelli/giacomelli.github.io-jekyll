module Jekyll
  module CustomFilters
    def galleryname(input)
      GalleryGenerator::getGalleryName(input)
    end

    def categorytitle(input)
      case input.gsub /[\[\]"]/, ''
      when 'Article'
        return 'Posts'
      when 'Tutorial'
        return 'Tutoriais'     
      else
        return input
      end
    end

    def categoryicon(input)
      case input.gsub /[\[\]"]/, ''
      when 'Article'
        iconName = 'newspaper'
      when 'Tutorial'
        iconName = 'eye'
      when 'Game'
        iconName = 'gamepad'
      when 'Interview'
        iconName = 'comments'
      when 'Event'
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