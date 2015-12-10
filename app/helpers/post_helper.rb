module PostHelper

  def detect_hashtags(message)
    hashtags = message.scan(/(#\w+)/).flatten
    return message if hashtags.size == 0

    linked_message = message.gsub(/\B[@#]\S+\b/) do |hash|
      tag = hash.tr('#', '')
      stored_hashtag = Hashtag.find_by(name: tag)
      link_to(hash, hashtag_path(hashtag: stored_hashtag.name))
    end

    return linked_message.html_safe
  end

end