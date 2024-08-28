require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? returns false for published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end

  test "published? returns true for published blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? returns false for draft blog post" do
    refute BlogPost.new(published_at: nil).published?
  end

  test "published? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
  end
end