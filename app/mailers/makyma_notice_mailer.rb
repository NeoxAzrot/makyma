class MakymaNoticeMailer < ApplicationMailer

  def suggested_alternative_email
    mail(to: 'makymaorg@gmail.com', subject: 'New Suggested Alternative')
  end
end
