module Jekyll
  class RemoveGistLinks < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<script>
        $(document).ready(function() {
          $('.gist-meta').remove();
        });
      </script>"
    end
  end
end

Liquid::Template.register_tag('removegistlinks', Jekyll::RemoveGistLinks)