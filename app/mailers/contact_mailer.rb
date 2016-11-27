class ContactMailer < ActionMailer::Base
  def contact(contact)
    @contact = contact
    mail(
      to: Rails.application.config_for(:secrets)['contact_email'],
      from: @contact.email,
      subject: "[anneardenmcdonald.com] New contact form submission from #{@contact.email}"
    )
  end
end
