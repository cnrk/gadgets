class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :file, ImageUploader
  belongs_to :gadget

  def to_fileupload
    {
      id: id,
      url: file.large.url,
    }
  end
end
