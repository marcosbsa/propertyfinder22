# frozen_string_literal: true

module PostsHelper
  def post_image_url(post)
    post.image2.present? ? post.image2.url : '/img'
  end
end
