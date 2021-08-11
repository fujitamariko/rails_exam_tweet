class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]
    def index
        @posts = Post.all
    end
    def new
        # ビューにデータを渡す（インスタンス変数を定義する）
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
        if @post.save
            # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
            redirect_to new_post_path, notice: "つぶやき投稿しました！"
        else
            # 入力フォームを再描画します。
            render :new
        end
    end
    def show
    end
    def edit
    end
    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: "つぶやきを編集しました！"
        else
            render :edit
        end
    end
    private
    def post_params
        params.require(:post).permit(:content)
    end
    def set_post
        @post = Post.find(params[:id])
    end
end