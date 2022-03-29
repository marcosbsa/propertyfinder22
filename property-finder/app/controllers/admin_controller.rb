# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :can_access?

  def accounts
    @accounts = Account.where(admin: false)
  end

  def can_access?
    @show_sidebar = true
    redirect_to root_url, flash: { danger: "You don't have access to view this page" } unless current_account.admin?
  end
end
