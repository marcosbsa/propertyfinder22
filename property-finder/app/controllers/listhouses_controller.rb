# frozen_string_literal: true

class ListhousesController < ApplicationController
  def index
    @properties = if params[:search]
                    Property.search(params[:search]).order('name').paginate(page: params[:page], per_page: 6)
                  else
                    Property.for_sale.paginate(page: params[:page], per_page: 6)
                  end
  end

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
