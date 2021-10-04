class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[ show edit update destroy ]
  
  def index
    @search_params = community_search_params
    # @communities = Community.search(@search_params)
    @communities = Community.search(@search_params).order(@search_params[:sort])
  end

  def show
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    
    if @community.save
      flash[:success] = 'コニュニティを作成しました。'
      redirect_to root_url
    else
      @pagy, @communities = pagy(current_user.feed_community.order(id: :desc))
      flash.now[:danger] = '作成に失敗しました。'
      render root_url
    end
  end

  def edit
  end

  def update
    if @community.update(community_params)
      flash[:success] = 'コミュニティを編集しました。'
      redirect_to @community
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @community.destroy
    flash[:success] = 'コミュニティを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def set_community
    @community = Community.find(params[:id])
  end
  
  def community_params
    # params.require(:community).permit(:user, :title, :url, :introduction, :kind, :tag_1, :tag_2, :tag_3, :tag_4, :tag_5)
    params.require(:community).permit(:keyword, :kind, :sort)
  end
  
  def community_search_params
    params.fetch(:search, {}).permit(:keyword, :kind, :sort)
  end
end