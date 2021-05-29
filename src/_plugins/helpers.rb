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

		def self.picture(context, image, className)
			image = Liquid::Template.parse(image).render(context)

			if image.include?(".svg") || image.include?(".gif")
				site = context.registers[:site]
		
				if !image.start_with?("/")
					image = "/#{image}"
				end

				Liquid::Template.parse("<img class='#{className}' src='#{image}' alt='post image'>").render(context)
			else
				Liquid::Template.parse("{% picture #{image} class=\"#{className}\" --alt post image %}").render(context)
			end
		end
	end
end