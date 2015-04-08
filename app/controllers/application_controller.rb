class ApplicationController < ActionController::API
	require 'json'
	puts Dir.pwd
	file = File.read(Rails.root + "app/assets/javascripts/msg.json")
	@@data_hash = JSON.parse(file)
end
