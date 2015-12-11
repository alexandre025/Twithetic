module InjectLinks

  extend ActiveSupport::Concern

  included do
    after_save do
      hashtags = self.message.scan(/(#\w+)/).flatten
      hashtags.each do |h|
        tag = h.tr('#', '')
        Hashtag.find_or_create_by(name: tag) do |hash|
          hash.mention = hash.mention + 1
        end
      end
    end
  end

end