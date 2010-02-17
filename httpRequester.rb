require 'net/http'

class HTTPRequester
	def initialize
	end

	def request( url )
		demand = Net::HTTP::Get.new( url.path )
		result = Net::HTTP.start( url.host, url.port ) { |http|
			http.request( demand )
		}

		result
	end

end
