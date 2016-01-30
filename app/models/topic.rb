class Topic < ActiveRecord::Base
  has_many :posts

  WillPaginate.per_page = 100
end
