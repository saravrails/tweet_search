class HomeController < ApplicationController
	require "twitter_search" 	
	
	def index		
		@client = TwitterSearch::Client.new 'FINIF'
		@tweets = @client.query(:q=>'$GOOG since:2011-05-19', :rpp=>100, :page=>1)		
		start_hour = @tweets.first.created_at.to_time.to_i
		end_hour = @tweets.last.created_at.to_time.to_i		
		h = {}
		end_hour.step(start_hour,3600) do |hour|			
			count = 0
			@tweets.each do |tweet|
				if "#{Time.at(hour).day}" == "#{Time.at(tweet.created_at.to_time.to_i).day}" and "#{Time.at(hour).hour}" == "#{Time.at(tweet.created_at.to_time.to_i).hour}"
					count += 1
				end
			end
			h[Time.at(hour).hour] = count
		end		
		
		result =  h
		@x_values = result.keys.sort
		@y_values = []
		@x_values.each do |x|
			@y_values << result[x]
		end
		
		#~ start_hour = session[:tweets].first.created_at.to_time.hour
		#~ end_hour = session[:tweets].last.created_at.to_time.hour		
		#~ h = {}
		#~ (end_hour..start_hour).each do |hour|
			#~ puts hour.inspect
			#~ count = 0
			#~ session[:tweets].each do |tweet|				
				#~ puts "#{hour} -- #{tweet.created_at.to_time.hour}"
				#~ if hour == tweet.created_at.to_time.hour
					#~ count += 1
				#~ end
			#~ end
			#~ h[hour] = count
		#~ end
		#~ result =  h		
		#~ puts result.inspect
		#~ @x_values = result.keys.sort
		#~ @y_values = []
		#~ @x_values.each do |x|
			#~ @y_values << result[x]
		#~ end
	end

end
