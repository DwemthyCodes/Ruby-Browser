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
		formatted_url = ensure_http_and_www( url )
		formatted_url = ensure_path( formatted_url )

		formatted_url
	end


	def ensure_http_and_www( url )
		if url !~ /http:\/\//
			if url !~ /www\./
				retval = "http://www." + url
			else
				retval = "http://" + url
			end
		elsif url !~ /www\./
			retval = url.sub( /http:\/\//, "http://www." )
		else
			retval = url.dup
		end
		
		retval
	end

	def ensure_path( url )
		if url !~ /http:\/\/www\.*\//
			retval = url + "/"
		else
			retval = url.dup
		end

		retval
	end
end
