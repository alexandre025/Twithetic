module ApplicationHelper

  def current_locale
    I18n.locale
  end

  def to_date(date,locale)
    if locale == :fr
      date.strftime('%d/%m/%Y')
    else
      date.strftime('%m/%d/%Y')
    end
  end

end
