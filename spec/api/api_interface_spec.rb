require "spec_helper"


describe ApiInterface::API do

	let(:gem_data) {GemData.create(:author_email => "autho@email.com",:user_email => "user@gmail.com" ,:gem_name  => "hast_permalink") }
  let(:gem_data_all) {GemData.all}

  it "should GET data by id" do
    gem_data
  	get "api/data/#{gem_data.id}"
  	response.body.should == gem_data.to_json
  end

  it "should GET all the data/empty if no data" do
    gem_data_all
  	get "api/data.json" 
  	#response.body.should == []
    response.body.should == "\"[]\""
  end


end