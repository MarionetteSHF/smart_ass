class CommentsController < ApplicationController
    before_action :check_login

    def check_login
        @current_user = session[:user_id]
        if @current_user == nil
          return redirect_to(login_path)
        end
        @user = User.find(session[:user_id])
      end
    
    # POST items/:id/comment
    def create

        comment = Comment.new
        comment.description = params[:description]
        comment.item_id = params[:id]
        comment.user_id = @current_user
        if comment.description.lstrip.rstrip == ""
            flash[:warning] = "Comment can not be empty!"
        else
            comment.save
            if comment.save
                flash[:notice] = "Comment added"
            else
                flash[:notice] = "Comment not added"
            end
        end
        redirect_to item_path(params[:id])
    end

end
