require 'grape'
require 'json'
module GemData
	class API < Grape::API

		resources :data do
			get ':word' do
        {:word => params[:word], :sentiment => "unkown"}.to_json
      end  

      post ':word' do
      {:word => params[:word], :result => "thinking"}.to_json
      end 
      #curl -X POST "http://localhost:3000/api/data/helloup.json"
		end
  
  end
	
end
