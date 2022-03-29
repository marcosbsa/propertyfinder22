# frozen_string_literal: true
class RealtorsController < ApplicationController
    def index
        @accounts = Account.all
      end
end
