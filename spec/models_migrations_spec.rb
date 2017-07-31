require 'rails_helper'

RSpec.describe "Models & Migrations" do

  begin
    Post.new
  rescue NameError => exc
    puts "Error - #{exc.message}"
    # puts exc.backtrace
    class Post < ActiveRecord::Base
    end
  end

    describe Post, :type => :model do
      it "has an associated table" do
        post = Post.new
        expect(post).to be_a_new(Post)
        expect { post.save }.to change { Post.count }.by(1)
        post.delete
      end

      it "has content property" do
        should have_db_column(:content)
        post_content = "This is my blog post"
        post = Post.new(content: post_content)
        post.content == post_content
      end

      it "has is_published property" do
        should have_db_column(:is_published)
        post = Post.new(is_published: true)
        # post.is_published == true
        expect(post.is_published).to be_in([true, false])
        # post.is_published == true
      end

      it "has many comments" do
        should have_many(:comments)
      end

      it "has seed data" do
        posts = Post.all
        expect(posts.count).to be > 1
      end
    end

  begin
    Comment.new
  rescue NameError => exc
    puts "Error - #{exc.message}"
    # puts exc.backtrace
    class Comment < ActiveRecord::Base
    end
  end

    describe Comment, :type => :model do
      it "has an associated table" do
        comment = Comment.new(post: Post.new)
        expect(comment).to be_a_new(Comment)
        expect { comment.save }.to change { Comment.count }.by(1)
      end

      it "has text property" do
        should have_db_column(:body)
        comment_body = "Good read"
        comment = Comment.new(body: comment_body)
        comment.body == comment_body
      end

      it "belongs to Post" do
        should belong_to(:post)
      end
    end

end