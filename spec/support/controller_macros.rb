# frozen_string_literal: true

module ControllerMacros
  def login_account
    before(:each) do
      account = FactoryBot.create(:account, admin: true)
      account.confirmed_at = Time.zone.now
      account.save
      @request.env['devise.mapping'] = Devise.mappings[:account]
      sign_in account
    end
  end
end
