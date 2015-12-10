module PostHelper

  def parse_tweet(message)
    hashtags = message.scan(/(#\w+)/).flatten
    mentions = message.scan(/(@\w+)/).flatten
    return message if hashtags.size == 0 && mentions.size == 0

    message = detect_hashtags message if hashtags.size > 0
    message = detect_mention message if mentions.size > 0

    return message.html_safe
  end

  def detect_hashtags(message)
    linked_message = message.gsub(/\B[#]\S+\b/) do |hash|
      tag = hash.tr('#', '')
      stored_hashtag = Hashtag.find_by(name: tag)
      link_to(hash, hashtag_path(hashtag: stored_hashtag.name)) if stored_hashtag.present?
    end

    return linked_message
  end

  def detect_mention(message)
    linked_message = message.gsub(/\B[@]\S+\b/) do |mention|
      user = mention.tr('@', '')
      stored_user = User.find_by(username: user)
      link_to(mention, user_path(stored_user)) if stored_user.present?
    end

    return linked_message
  end

end