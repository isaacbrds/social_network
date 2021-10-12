class User::PostsController < UserController
  skip_before_action :verify_authenticity_token, only: [:like_toggle]

  def create
    p_params = post_params.merge(user: current_user)
    @posts = Post.new(p_params)
    if @posts.save 
      redirect_to user_profile_path
    else
      render "user/profile/show"
    end
  end

  def destroy
    posts = current_user.posts.find(params[:id])
    posts.destroy
    redirect_to user_profile_path
  end

  def like_toggle
    post = Post.find(params[:id])
    like = Like.find_by(user: current_user, post: post)
    if like.present?
      like.destroy
      respond_to do |format|
        format.json { render json: {liked: false, likesCount: post.likes.count} }
      end
    else
      Like.create(user: current_user, post: post)
      respond_to do |format|
        format.json { render json: {liked: true, likesCount: post.likes.count} }
      end
    end
  end
  private 
  def post_params
    params.require(:post).permit(:body)
  end
end