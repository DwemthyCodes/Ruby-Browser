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
			@title = fillToWidth( $2 )
		end
	end

	def calcWidth
		`export COLUMNS`
		@width = ENV['COLUMNS'].to_i
	end

	def fillToWidth( text )
		calcWidth
		spaceToFill = @width - text.length

		frontFill = endFill = spaceToFill/2
		if spaceToFill%2 == 1
			endFill += 1
		end

		filledText = ''
		frontFill.times do
			filledText += '-'
		end

		filledText += text
		endFill.times do 
			filledText += '-'
		end

		filledText
	end

end
