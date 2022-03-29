# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  before(:each) do
    assign(:posts, [
             Post.create!(
               title: 'Title',
               url: 'www.exemple.com',
               summary: 'Summary',
               body: 'Text'
             ),
             Post.create!(
               title: 'Title',
               url: 'www.exemple.com',
               summary: 'Summary',
               body: 'Text'
             )
           ])
  end

  it 'renders a list of posts' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    # assert_select "tr>td", text: "url".to_s, count: 2
    assert_select 'tr>td', text: 'Summary'.to_s, count: 2
    # assert_select "tr>td", text: "Text".to_s, count: 2
  end
end
