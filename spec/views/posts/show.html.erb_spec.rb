# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
                            title: 'MyTitle',
                            url: 'www.example.com',
                            summary: 'MyTitle',
                            body: 'MyBody'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyTitle/)
    expect(rendered).to match(/www.example.com/)
    expect(rendered).to match(/MyTitle/)
    expect(rendered).to match(/MyBody/)
  end
end
