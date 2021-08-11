class PostsController < ApplicationController
    def index
    end
    def new
        # ビューにデータを渡す（インスタンス変数を定義する）
        @post = Post.new
    end
    def create
        # モデルにDB操作の命令を出す
        Post.create(post_params)
        # リダイレクトを行う
        redirect_to new_post_path
    end
    private
    def post_params
        params.require(:post).permit(:content)
    end
end