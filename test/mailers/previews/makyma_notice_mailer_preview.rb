# Preview all emails at http://localhost:3000/rails/mailers/makyma_notice_mailer
class MakymaNoticeMailerPreview < ActionMailer::Preview

  def makyma_notice_mailer_preview
    MakymaNoticeMailer.suggested_alternative_email.deliver_now
  end

end
