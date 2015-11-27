module ImageAsset
  extend ActiveSupport::Concern

  included do
    after_post_process :find_dimensions

    validates_attachment :attachment, :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

    def find_dimensions
      temporary = attachment.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = attachment.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.attachment_width  = geometry.width
      self.attachment_height = geometry.height
    end
  end
end