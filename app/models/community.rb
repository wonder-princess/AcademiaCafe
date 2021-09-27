class Community < ApplicationRecord
  # has_many :tags
  # belongs_to :user;
  
  enum kind: { slack: 1, discode: 2, other: 3 }
  
  scope :search, -> (search_params) do
    return if search_params.blank?

    keyword_like(search_params[:keyword])
      .kind_in(search_params[:kind])
      .sort_is(search_params[:sort])
      # .prefecture_id_is(search_params[:prefecture_id])
  end
  scope :keyword_like, -> (keyword) { where('title LIKE ? OR introduction LIKE ?', "%#{keyword}%", "%#{keyword}%") if keyword.present? }
  scope :kind_in, -> (kind) { where(kind: kind) if kind.present? }
  # scope :kind_in, -> (kind) { where(kind: '[kind, kind, kind]'), "%#{kind}%", "%#{kind}%", "%#{kind}%" if kind.present? }
  scope :sort_is, -> (sort) { order(sort: sort) if sort.present? }  
  # scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }

  # def self.search_alt(search)
  #   if search != ""
  #     Community.where(['title LIKE(?) OR introduction LIKE(?)', "%#{search}%", "%#{search}%"])
  #   else
  #     Community.includes(:id).order('created_at DESC')
  #   end
  # end
end
