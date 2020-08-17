class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #validate :validate_image

  #def validate_image
  #  return unless image.attached?
    
  #end

  
end
