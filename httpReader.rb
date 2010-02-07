require 'net/http'
require 'uri'

GREETING = "Enter a URL"
puts GREETING
while line = gets
	#Allow the user to quit
	if line == "quit" || line == "exit"
		break
	end
	#Naive formatting for the request
	if line !~ /http:\/\//
		if line !~ /www./
			line = "http://www." + line
		else
			line = "http:" + line
		end
	elsif line !~ /www./
		line.sub!( /http:\/\//, "http://www." )
	end
	#Parse the URL
	url = URI.parse(line)
	#Make the request to the url
	res = Net::HTTP.start(url.host, url.port) { |http| http.get('/index.html') }
	#Remove comments from the returned html
	res.body.gsub!( /<!--.*-->/, '' )
	#Attempt to remove script blocks, since we're not running them
	#Not working just right yet, not sure about this regex
	res.body.gsub!( /<script\s.*>.*<\/script>/, '' )
	#Print the body, looks messy, in future, well organized implementations this will be a returned value to
	#be further processed and made to look nice
	puts res
	puts "\n#{GREETING}"
end

