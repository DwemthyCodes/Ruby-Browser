require 'urlParser.rb'
require 'httpRequester.rb'
require 'htmlReader.rb'
require 'page.rb'

class Browser

	def initialize
		@parser = URLParser.new
		@requester = HTTPRequester.new
		@reader = HTMLReader.new
	end

	def browse( url )
		puts "Parsing " + url
		parsed_url = @parser.parse( url )
		puts "Requesting " 
		raw_html = @requester.request( parsed_url )
		puts "Processing HTML "
		page = @reader.format( raw_html )
		@page = Page.new( page )
	end
end
