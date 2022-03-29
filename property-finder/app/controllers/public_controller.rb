# frozen_string_literal: true

class PublicController < ApplicationController
  def main
    if account_signed_in?
      path = current_account.admin? ? accounts_path : dashboard_path
      redirect_to path, flash: { success: 'Successfully signed in. Welcome to Property Finder!' } and return
    end

    @properties = Property.latest
    @posts = Post.latest

    @properties = if params[:search]
                    Property.search(params[:search]).order('name').paginate(page: params[:page],
                                                                            per_page: 6).order('id DESC')
                  else
                    Property.all.paginate(page: params[:page], per_page: 6).order('id DESC')
                  end

    @posts = Post.all.paginate(page: params[:page], per_page: 4).order('id DESC')
  end
end
