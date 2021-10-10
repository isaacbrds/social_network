class User::PostsController < UserController
  def create
    p_params = post_params.merge(user: current_user)
    @posts = Post.new(p_params)
    if @posts.save 
      redirect_to user_profile_path
    else
      render "user/profile/show"
    end
  end

  private 
  def post_params
    params.require(:post).permit(:body)
  end
end