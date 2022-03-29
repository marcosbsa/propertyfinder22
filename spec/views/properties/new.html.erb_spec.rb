# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'properties/new', type: :view do
  before(:each) do
    assign(:property, Property.new(
                        account: create(:account),
                        name: 'MyString',
                        address: 'MyString',
                        price: 999_999,
                        rooms: 23,
                        bathrooms: 12,
                        parking_spaces: 45,
                        square_feet: 7890,
                        for_sale: true,
                        status: 'Available',
                        details: 'MyText'
                      ))
  end

  it 'renders new property form' do
    render

    assert_select 'form[action=?][method=?]', properties_path, 'post' do
    end
  end
end
