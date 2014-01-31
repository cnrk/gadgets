class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :file, ImageUploader
  belongs_to :gadget
 end
