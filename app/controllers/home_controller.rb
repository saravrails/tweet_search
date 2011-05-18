class HomeController < ApplicationController
	require "twitter_search" 	
	
	def index
		session[:tweets] =nil
		@client = TwitterSearch::Client.new 'FINIF'
		@tweets = @client.query(:q=>'$GOOG since:2011-05-18', :rpp=>100, :page=>1)
		session[:tweets] = @tweets 
		start_hour = session[:tweets].first.created_at.to_time.hour
		end_hour = session[:tweets].last.created_at.to_time.hour
		h = {}
		(end_hour..start_hour).each do |hour|
			count = 0
			session[:tweets].each do |tweet|				
				if hour == tweet.created_at.to_time.hour
					count += 1
				end
			end
			h[hour] = count
		end
		result =  h		
		@x_values = result.keys.sort
		@y_values = []
		@x_values.each do |x|
			@y_values << result[x]
		end
	end

end
