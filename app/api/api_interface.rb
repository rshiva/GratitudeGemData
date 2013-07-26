require 'grape'
require 'json'
module ApiInterface
	class API < Grape::API

		resources :data do
			get  do
        GemData.all.to_json        
      end  

      post do
      params={:author_email => params[:author_email], :user_email => params[:user_email] ,gem_name: params[:gem_name]}
      @gem_data=GemData.new(params) if params
      @gem_data.save
      status 201
      @gem_data
      end 
      #curl -X POST "http://localhost:3001/api/data/helloup.json"
      #curl -d '{"author_email": "r6@gmail.com" , "user_email": "shiva@example.com","gem": "has_me"}' -X POST -H Content-Type:application/json http://localhost:3001/api/data
		end
  
  end
	
end
