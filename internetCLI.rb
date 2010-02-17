#!/bin/ruby
require 'browser.rb'

GREETING = "Welcome to the command line interface for the Internet!\n"
USAGE = "http:// and www are optional in this interface\n" +
				"the . domain and follwing / are needed as it stands\n"
PROMPT = "Please enter a url:"

browser = Browser.new

puts GREETING

puts USAGE

puts PROMPT

while url = gets
	url.chomp!
	if url == 'quit' || url == 'q' || url == 'exit'
		puts "Nice talking to you"
		break
	end
	page = browser.browse( url )
	puts page

	puts PROMPT
end
