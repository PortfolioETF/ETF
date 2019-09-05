class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_extension
    image_id.accept_extensions
  end
end
