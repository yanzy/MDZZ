class Document < ActiveRecord::Base
  belongs_to :fileable, polymorphic: true
end
