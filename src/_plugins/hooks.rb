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
  # APPS
  # system("copy -R apps/unitytips-museum/_content _site/apps/unitytips-museum/_content/")
  # system("copy -R apps/unitytips-museum/_framework _site/apps/unitytips-museum/_framework/")

  # system("cp -R apps/geneticsharp-runner-blazorapp/_content _site/apps/geneticsharp-runner-blazorapp/_content/")
  # system("cp -R apps/geneticsharp-runner-blazorapp/_framework _site/apps/geneticsharp-runner-blazorapp/_framework/")

  # system("cp -R apps/arc-8/_content _site/apps/arc-8/_content/")
  # system("cp -R apps/arc-8/_framework _site/apps/arc-8/_framework/")


  # # GAMES
  # system("cp -R games-src/index-replacement.html _site/games/index.html")
  # system("cp -R games-src/nibble/play.html _site/games/nibble/play.html")
  # system("cp -R games-src/nibble/NIBBLE.zip _site/games/nibble/NIBBLE.zip")
  # system("cp -R games-src/puzzimals/demo _site/games/puzzimals/demo") 
end

