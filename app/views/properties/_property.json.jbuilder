# frozen_string_literal: true

json.extract! property, :id, :name, :address, :price, :rooms, :bathrooms, :parking_spaces, :square_feet, :details,
              :created_at, :updated_at
json.url property_url(property, format: :json)
