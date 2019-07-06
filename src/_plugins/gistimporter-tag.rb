module Jekyll
  class GistImporterTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @path =  text
    end

    def render(context)
      "<link rel='stylesheet' href='https://github.githubassets.com/assets/gist-embed-a9a1cf2ca01efd362bfa52312712ae94.css'><div class='gist' style='margin-top:-17px'>
        <div class='gist-file'>
          <div class='gist-meta'>
            <a href='/unitytips-gist-importer/'>You can easily import this gist directly into your Unity 3D project using the <b>Gist Importer</b><img style='float:right;width:48px;' src='/assets/logos/unity3d.png' /></a></div>
        </div>
      </div>"
    end
  end
end

Liquid::Template.register_tag('gistimporter', Jekyll::GistImporterTag)