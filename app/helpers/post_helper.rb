module PostHelper

  def detect_hashtags(message)
    hashtags = message.scan(/(#\w+)/).flatten
    return message if hashtags.size == 0

    linked_hashtags = []

    hashtags.each do |h|
      tag = h.tr('#', '')
      stored_hashtag = Hashtag.select(:name).where(name: tag).first
      if stored_hashtag.present?
        linked_hashtags << link_to(h, hashtag_path(hashtag: stored_hashtag.name))
      end
    end
    message_without_hashtags = message.gsub!(/\B[@#]\S+\b/, '')

    return "#{message_without_hashtags} #{linked_hashtags.join(' ')}".html_safe
  end

end