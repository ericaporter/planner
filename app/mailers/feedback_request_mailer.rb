class FeedbackRequestMailer  < ActionMailer::Base
  include EmailHeaderHelper

  layout 'email'

  def request_feedback sessions, member, feedback_request
    @session = sessions
    @host_address = AddressDecorator.decorate(@session.host.address)
    @member = member
    @feedback_request = feedback_request

    load_attachments

    subject = "Feedback for Codebar workshop - #{l(@session.date_and_time, format: :email_title)}"

    mail(mail_args(member, subject)) do |format|
      format.html
    end
  end

  helper do
    def full_url_for path
      "#{@host}#{path}"
    end
  end
end
