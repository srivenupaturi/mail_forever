module ApplicationHelper
  def title page_title = nil
    title_prefix = 'MailForever'
    page_title ? (title_prefix + ' | ' + page_title) : title_prefix
  end
end
