class Video < ActiveRecord::Base
  attr_accessible :active, :title, :embed_id, :source
end
