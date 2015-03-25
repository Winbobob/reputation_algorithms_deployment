#!/usr/bin/env ruby

# The above line turns this file into an executable script as long as file permissions include 'x'
# Command: ./rest_client.rb

require 'rest_client'

# Deployed on Phusion Passenger
url = 'http://railsapitest.localhost'
# Deployed on WEBrick
#url = 'http://localhost:3000'

begin
	# Retrieve all customers:
	response = RestClient.get "#{url}/api/customers"

	# Retrieve a single customer:
	#response = RestClient.get "#{url}/api/customers/8"

	# Create a customer:
	#response = RestClient.post "#{url}/api/customers",
	# {:customer => {:name => 'customerF', :street => '567 Preston Rd.', :city => 'Dallas', :state => 'Texas',
	#  :zipcode => '76230' , :home_phone => '214-555-1212', :work_phone => '', :email => 'customerF@example.com'}}

	# Update a customer:
	#response = RestClient.put "#{url}/api/customers/13", {:customer => {:name => ''}}
	#response = RestClient.put "#{url}/api/customers/13", {:customer => {:name => 'customerG'}}

	# Delete a customer:
	#response = RestClient.delete "#{url}/api/customers/13"

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

#customerF@example.com

