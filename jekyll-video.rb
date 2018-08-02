# Jekyll Video
# 
# Adds a "video" Liquid tag
# 
# Author: Gerald Schneider
# Copyright: Copyright 2018 Gerald Schneider
# License: GPLv2 or later
# Version: 0.1

module Jekyll
	class VideoTag < Liquid::Block
	 	def initialize(tag_name, markup, tokens)
			super
			# markup holds parameters in {% video ... %}
		end

		def render(context)
			@config = context.registers[:site].config['video']
			nl = nodelist()
  		text = nl[0].strip!
  		*lines = text.split(/\n/).map(&:strip).reject(&:empty?)
  		src, poster = lines[0].split(/\s*::\s*/, 2)
      url = (@config['url'] != nil) ? @config['url'] : 800
      src = "#{url}#{src}"
      poster = "#{url}#{poster}"
			width = (@config['width'] != nil) ? @config['width'] : 800
  		novideo = (@config['novideo'] != nil) ? @config['novideo'] : "Here should be a video player. If you don't see it you can download the video directly here: <a href=\"{src}\">{src}</a>."
      novideo = novideo.gsub! '{src}', src

			video_html = "<video controls src=\"#{src}\" poster=\"#{poster}\" width=\"#{width}\">#{novideo}</video>\n"

			return video_html
		end
	end
end

Liquid::Template.register_tag('video', Jekyll::VideoTag)