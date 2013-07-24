class GemData < ActiveRecord::Base
  attr_accessible :author_email, :gem_name, :message, :user_email
end
