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
        
        comment.save
        if comment.save
            flash[:notice] = "comment added"
        else
            flash[:notice] = "comment not added"
        end
        redirect_to item_path(params[:id])
    end

end
