Jekyll::Hooks.register :posts, :pre_render do |post|
    galleryName = Jekyll::GalleryGenerator::getGalleryName(post.path)
    gallery = post.site.data['galleries'][galleryName];

    if gallery != nil
      gallery.each do |pic|
        if pic.include? 'logo'
          post.data['logo'] = pic
        end
      end
    end
end

Jekyll::Hooks.register :site, :post_write do
  system("cp -R apps/unitytips-search/_content _site/apps/unitytips-search/_content/")
  system("cp -R apps/unitytips-search/_framework _site/apps/unitytips-search/_framework/")
end

