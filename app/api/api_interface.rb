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
      #curl -X POST "http://localhost:3000/api/data/helloup.json"
		end
  
  end
	
end
