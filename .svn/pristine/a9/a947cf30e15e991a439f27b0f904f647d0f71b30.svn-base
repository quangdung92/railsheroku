class Notifier < ActionMailer::Base

  def send_email_notifications(_recipient ,_subject, _content)
    @content = _content
    mail to: _recipient, subject: _subject
  end

end
