require 'webrick/htmlutils'

class HTMLReader
	include WEBrick::HTMLUtils

	def initialize
	end

	def format( html )
		raw_html = html.body
		uncommented_html = uncomment( raw_html )
		descripted_html = descript( uncommented_html )

		page = descripted_html

		page

	end
	
	def uncomment( html )
		html.gsub!( /<!--.*-->/, '')

		html
	end

	def descript( html )
		html.gsub!( /<script>.*<\/script>/, '' )
		html.gsub!( /<script\s.*\/>/, '' )

		html
	end
end
