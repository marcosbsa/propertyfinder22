# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'properties/index', type: :view do
  before(:each) do
    assign(:properties, [
             Property.create!(
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
             ),
             Property.create!(
               account: create(:account),
               name: 'MyString',
               address: 'MyString',
               price: 999_979,
               rooms: 26,
               bathrooms: 17,
               parking_spaces: 50,
               square_feet: 7820,
               for_sale: true,
               status: 'Available',
               details: 'MyText'
             )
           ])
  end

  it 'renders a list of properties' do
    render
    assert_select 'tr>td', text: 'MyString'.to_s, count: 4
    # assert_select "tr>td", text: 'MyString'.to_s, count: 2
    assert_select 'tr>td', text: 999_999.to_s, count: 1
    assert_select 'tr>td', text: 23.to_s, count: 1
    assert_select 'tr>td', text: 12.to_s, count: 1
    # assert_select "tr>td", text: 45.to_s, count: 1
    # assert_select "tr>td", text: 7890.to_s, count: 1
    # assert_select "tr>td", text: 'Available'.to_s, count: 2
    # assert_select "tr>td", text: 'MyText'.to_s, count: 2
  end
end
