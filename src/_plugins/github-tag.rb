module Jekyll
  class GitHubTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @path =  text
      @filename = File.basename(@path)
    end

    def render(context)
      "<link rel='stylesheet' href='https://github.githubassets.com/assets/gist-embed-a9a1cf2ca01efd362bfa52312712ae94.css'><div class='gist'>
        <div class='gist-file'>
          <div class='gist-meta'>Open <a href='https://github.com/#{@path}'>#{@filename}</a>hosted with ❤ by <a href='https://github.com'>GitHub</a>
          </div>
        </div>
      </div>"
    end
  end
end

Liquid::Template.register_tag('github', Jekyll::GitHubTag)