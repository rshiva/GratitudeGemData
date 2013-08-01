require 'grape'
require 'json'
module ApiInterface
	class API < Grape::API
		
	#version 'v1', using: :path
    default_format :json

    resources :data do
     	
      get  do
        GemData.all       
      end  

      get ':id' do
        GemData.find(params[:id])
      end
    
      params do
        requires :author_email , type: String , desc: "Author email id" , regexp: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 
        requires :user_email , type: String , desc: "User email id" , regexp: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 
      end

      post do
        post_params={:author_email => params[:author_email],:user_email => params[:user_email],:gem_name  => params[:gem_name]}
        # didnt used params as variable name because giving error NoMethodError (undefined method `[]' for nil:NilClass):
        @gem_data=GemData.new(post_params)
        @gem_data.save
        @gem_data
      end 

    end
  end
end

      #curl -d '{"author_email": "Metallica", "user_email": "metallica@metalhead.com"}' -X POST -H Content-Type:application/json h//localhost:3000/api/data.json



