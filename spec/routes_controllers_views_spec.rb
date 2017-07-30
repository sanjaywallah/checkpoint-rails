require 'rails_helper'

RSpec.describe "Routes, Controllers & Views" do

  begin

  describe PostsController, type: :controller do
    render_views

    before do
      @post1 = Post.create!(content: 'My crazy post about a thing')
      @postNew = {content: 'My really crazy post about a thing'}
    end

    describe "Routing" do
      it "routes the index action" do
        should route(:get, '/posts').to(action: :index)
      end

      it "routes the show action" do
        should route(:get, '/posts/1').to(action: :show, id: 1)
      end

      it "routes the new action" do
        should route(:get, '/posts/new').to(action: :new)
      end

      it "routes the create action" do
        should route(:post, '/posts').to(action: :create)
      end
    end


    describe "index action" do
      it "renders template" do
        get :index
        expect(response).to render_template(:index)
      end

      it "assigns @posts" do
        get :index
        expect(assigns(:posts)).to eq(Post.all)
      end

      it "renders all the posts content" do
        get :index
        expect(response.body).to match /.*#{Post.second.content}/im
      end
    end

    describe "show action" do
      it "renders template" do
        get :show, params: {id: @post1}
        expect(response).to render_template(:show)
      end

      it "assigns @post" do
        get :show, params: {id: @post1}
        expect(assigns(:post)).to eq(@post1)
      end

      it "renders a post's content" do
        get :show, params: {id: @post1}
        expect(response.body).to match /.*#{@post1.content}/im
      end
    end

    describe "new action" do
      it "renders template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns empty @post" do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "renders a post form" do
        get :new
        expect(response.body).to match /<form.*action="\/posts".*<input.*name="post\[content\]".*/im
      end
    end

    describe "create action" do
      it "assigns @post" do
        post :create, params: {post: @postNew}
        expect(assigns(:post).content).to eq(@postNew[:content])
      end

      it "stores new post" do
        post :create, params: {post: @postNew}
        expect(assigns(:post)).to eq(Post.find(assigns(:post).id))
        # expect { post.save }.to change { Post.count }.by(1)
      end

      it "redirects to /posts/:id" do
        post :create, params: {post: @postNew}
        expect(subject).to redirect_to(:action => :show,
                                        :id => assigns(:post).id)
      end
    end

  end
  
  rescue NameError => exc
    puts "Error - #{exc.message}"
    # puts exc.backtrace
  end

end
