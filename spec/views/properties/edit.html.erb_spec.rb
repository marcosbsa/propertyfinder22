# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'properties/edit', type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
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

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', property_path(@property), 'post' do
      assert_select 'input[name=?]', 'property[name]'

      assert_select 'input[name=?]', 'property[address]'

      assert_select 'input[name=?]', 'property[price]'

      assert_select 'input[name=?]', 'property[rooms]'

      assert_select 'input[name=?]', 'property[bathrooms]'

      assert_select 'input[name=?]', 'property[parking_spaces]'

      assert_select 'input[name=?]', 'property[square_feet]'

      # assert_select "input[name=?]", "property[for_sale]"

      # assert_select "input[name=?]", "property[status]"

      # assert_select "input[name=?]", "property[details]"
    end
  end
end
