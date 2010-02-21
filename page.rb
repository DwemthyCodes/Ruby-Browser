class Page

	def initialize( html )
		processHead( html )
		processBody( html )
	end

	def processHead( html )
		if( html =~ /(<head>)(.*)(<\/head>)/m )
			@header = $2
			makeTitle()
			if( @title )
				puts @title
			else
				puts "---HEADER START---\n" + @header + "---HEADER END---\n"
			end
		end
	end

	def processBody( html )
		if( html =~ /(<body>)(.*)(<\/body>)/m )
			@body = $2
			puts "---BODY START---\n" + @body + "---BODY END---\n"
		end
	end

	def makeTitle
		if( @header =~ /(<title>)(.*)(<\/title>)/ )
			@title = "--------" + $2 + "--------\n"
		end
	end

end
