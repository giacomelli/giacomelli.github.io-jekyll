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
  system("cp -R apps/unitytips-museum/_content _site/apps/unitytips-museum/_content/")
  system("cp -R apps/unitytips-museum/_framework _site/apps/unitytips-museum/_framework/")

  system("cp -R apps/geneticsharp-runner-blazorapp/_content _site/apps/geneticsharp-runner-blazorapp/_content/")
  system("cp -R apps/geneticsharp-runner-blazorapp/_framework _site/apps/geneticsharp-runner-blazorapp/_framework/")

  system("cp -R tools/meu-navegador _site/tools/my-browser")  
  system("
  cd _site/tools/my-browser
  sed -i '' 's/{{my-browser}}/My Browser/g' index.html  
  sed -i '' 's/{{my-browser-url}}/http:\\/\\/diegogiacomelli.com.br\\/tools\\/my-browser/g' index.html  
  sed -i '' 's/{{generate-image}}/Generate image/g' index.html  
  sed -i '' 's/{{download-image}}/Download image/g' index.html  
  sed -i '' 's/{{image-name}}/mybrowser/g' index.html  
  sed -i '' 's/{{wait-msg}}/Wait.../g' index.html  
  sed -i '' 's/{{portuguese}}/Portuguese/g' index.html  
  sed -i '' 's/{{english}}/English/g' index.html  
  sed -i '' 's/{{connection}}/Connection/g' index.html  
  sed -i '' 's/{{browser}}/Browser/g' index.html  
  sed -i '' 's/{{device}}/Device/g' index.html  
  sed -i '' 's/{{os}}/OS/g' index.html  
  sed -i '' 's/{{language}}/Language/g' index.html  
  sed -i '' 's/{{datetime}}/Date\\/Time/g' index.html  
  ");  

  system("
  cd _site/tools/meu-navegador
  sed -i '' 's/{{my-browser}}/Meu Navegador/g' index.html  
  sed -i '' 's/{{my-browser-url}}/http:\\/\\/diegogiacomelli.com.br\\/tools\\/meu-navegador/g' index.html  
  sed -i '' 's/{{generate-image}}/Gerar imagem/g' index.html  
  sed -i '' 's/{{download-image}}/Download da imagem/g' index.html  
  sed -i '' 's/{{image-name}}/meunavegador/g' index.html  
  sed -i '' 's/{{wait-msg}}/Aguarde.../g' index.html  
  sed -i '' 's/{{portuguese}}/Português/g' index.html  
  sed -i '' 's/{{english}}/Inglês/g' index.html  
  sed -i '' 's/{{connection}}/Conexão/g' index.html  
  sed -i '' 's/{{browser}}/Navegador/g' index.html  
  sed -i '' 's/{{device}}/Dispositivo/g' index.html  
  sed -i '' 's/{{os}}/Sistema Operacional/g' index.html  
  sed -i '' 's/{{language}}/Idioma/g' index.html  
  sed -i '' 's/{{datetime}}/Data\\/Hora/g' index.html  
  "); 
end

