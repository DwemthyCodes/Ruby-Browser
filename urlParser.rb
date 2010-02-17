require 'uri'

class URLParser

	def initialize
	end

	def parse( url )
	
		formatted_url = format( url )
		completed_url = URI.parse( formatted_url )

		completed_url

	end

	def format( url )
		if url !~ /http:\/\//
			if url !~ /www./
				url = "http://www." + url
			else
				url = "http://" + url
			end
		elsif url !~ /www./
			url.sub!( /http:\/\//, "http://www." )
		end
puts url
		url
	end

end
