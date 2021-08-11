class PostsController < ApplicationController
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
        @post = Post.find(params[:id])
    end
    private
    def post_params
        params.require(:post).permit(:content)
    end
end