module Jekyll
	class Helper
		def self.toMarkdown(context, text)
			site = context.registers[:site]
			converter = site.find_converter_instance(Jekyll::Converters::Markdown)
			converter.convert(text);
		end 

		def self.include(context, file)
			Liquid::Template.parse("{% include #{file} %}").render(context)
		end
	end
end