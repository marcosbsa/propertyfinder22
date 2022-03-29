# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def email_agent(agent_id, first_name, last_name, email, message)
    @agent = Account.find(agent_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @message = message

    mail to: @agent.email, message: 'You have a new message from Property Finder' if @agent.present?
  end
end
