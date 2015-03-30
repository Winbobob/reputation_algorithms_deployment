#!/usr/bin/env ruby

# The above line turns this file into an executable script as long as file permissions include 'x'
# Command: ./rest_client.rb

require 'rest_client'

# Deployed on Phusion Passenger
url = 'http://railsapitest.localhost'
# Deployed on WEBrick
#url = 'http://localhost:3000'

begin
	# Retrieve all reputations:
	response = RestClient.get "#{url}/api/reputations"

	# Retrieve a single reputation:
	#response = RestClient.get "#{url}/api/reputations/8"

	# Create a reputation:
	#response = RestClient.post "#{url}/api/reputations",
	# {:reputation => {:name => 'reputationF', :street => '567 Preston Rd.', :city => 'Dallas', :state => 'Texas',
	#  :zipcode => '76230' , :home_phone => '214-555-1212', :work_phone => '', :email => 'reputationF@example.com'}}

	# Update a reputation:
	#response = RestClient.put "#{url}/api/reputations/13", {:reputation => {:name => ''}}
	#response = RestClient.put "#{url}/api/reputations/13", {:reputation => {:name => 'reputationG'}}

	# Delete a reputation:
	#response = RestClient.delete "#{url}/api/reputations/13"

	puts "Response code: #{response.code}" 
	puts "Response body:"
	puts JSON.pretty_generate(JSON.parse(response.body))
#	puts "#{response.body}" 
rescue RestClient::Exception => e
	puts "Response code: #{e.response.code}" 
	puts "Response body:"
	puts JSON.pretty_generate(JSON.parse(e.response.body))
#	puts "#{e.response.body}" 
end

#reputationF@example.com

