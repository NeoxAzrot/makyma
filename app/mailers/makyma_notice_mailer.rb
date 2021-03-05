class MakymaNoticeMailer < ApplicationMailer

  default from: 'makyma@notification'

  def suggested_alternative_email
    mail(to: 'contact@makyma.org', subject: 'New Suggested Alternative')
  end
end
