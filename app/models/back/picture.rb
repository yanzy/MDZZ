class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: ture
end
