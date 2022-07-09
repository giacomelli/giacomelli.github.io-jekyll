module Jekyll
  class ItchIOTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<center>
        <iframe class="itchio-iframe" frameborder="0" src="https://itch.io/embed/' + @text + '">         
        </iframe>
       </center>'
    end
  end
end

Liquid::Template.register_tag('itchio', Jekyll::ItchIOTag)