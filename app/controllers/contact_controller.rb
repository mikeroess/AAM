class ContactController < ApplicationController
  before_action :init_captcha

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(@captcha.values)

    if !@captcha.valid?
      @errors = [@captcha.error]
      render action: :new
    elsif !@contact.valid?
      @errors = @contact.errors.full_messages unless @contact.errors.empty?
      render action: :new
    else
      ContactMailer.contact(@contact).deliver
    end
  end

  private

  def init_captcha
    @captcha = NegativeCaptcha.new(
      secret: Rails.application.config_for(:secrets)['captcha_key'],
      spinner: request.remote_ip,
      fields: [:email, :message],
      css: 'display: none',
      params: params
    )
  end
end
