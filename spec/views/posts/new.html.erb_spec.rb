# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  before(:each) do
    assign(:post, Post.new(
                    title: 'MyString',
                    url: 'MyString',
                    summary: 'MyString',
                    body: 'MyString'
                  ))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'input[name=?]', 'post[url]'

      assert_select 'input[name=?]', 'post[summary]'

      # assert_select "input[name=?]", "post[body]"
    end
  end
end
