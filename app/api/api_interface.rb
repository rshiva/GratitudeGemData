require 'grape'
require 'json'
module ApiInterface
	class API < Grape::API

		resources :data do
			get  do
        GemData.all.to_json        
      end  
      
      params do
        requires :author_email , type: String , desc: "Author email id" #,, regexp: /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i 
        requires :user_email , type: String , desc: "User email id" #, regexp: /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i
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
