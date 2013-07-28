require "spec_helper"



describe ApiInterface::API do

  gem_data = FactoryGirl.create(:gem_data)
  gem_data_nil_author=FactoryGirl.build(:gem_data,:author_email => "")
  gem_data_nil_user=FactoryGirl.build(:gem_data,:user_email => "")
  let(:gem_data_all) {GemData.create(:author_email => "autho@email.com",:user_email => "user@gmail.com" ,:gem_name  => "hast_permalink") }
  it "should GET data by id" do
    gem_data
  	get "api/data/#{gem_data.id}"
  	response.body.should == gem_data.to_json
  end

  it "should GET all the data/empty if no data" do
    gem_data.to_json
  	get "api/data.json" 
  	#response.body.should == []
    #response.body.should == gem_data.all.to_json
  end

  it "should fail to save if author_email is nil" do
   post "api/data",'{"user_email":"author_email@gmail.com"}', { 'CONTENT_TYPE' => 'application/json' }
   response.body.should == "missing parameter: author_email"
  end
  
  it "should fail to save if user_email is nil" do
   post "api/data", '{"author_email":"author_email@gmail.com"}', { 'CONTENT_TYPE' => 'application/json' }
   response.body.should == "missing parameter: user_email"
  end

  it "should create record with valid data" do

  end


end