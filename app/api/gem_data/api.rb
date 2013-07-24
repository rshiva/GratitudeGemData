require 'grape'

module GemData
	class API < Grape::API
		resource :gem_datas do

		  post do 
        status 201
        puts "===>",params
      end 
    end

  end


end
