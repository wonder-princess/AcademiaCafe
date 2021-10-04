class UsersController < ApplicationController
  
  # 検索した際にのみ結果を表示したい場合、indexを定義するか
  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 10)
  end

  def show
    @user = User.find(params[:id])
    @pagy, @community = pagy(@user.community.order(id: :desc))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを編集しました。'
      redirect_to @task
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = current_user.user.find_by(id: params[:id])
    unless @user
      # なんかそれっぽい処理
      redirect_to root_url
    end
  end
  
  def user_search_params
    params.fetch(:search, {}).permit(:id, :name, :sort)
  end
end
