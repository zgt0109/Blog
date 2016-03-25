# == Schema Information
#
# Table name: articles
#
#  id              :integer          not null, primary key
#  admin_id        :integer
#  user_id         :integer
#  title           :string
#  content         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#  article_type_id :integer
#
# Indexes
#
#  index_articles_on_admin_id  (admin_id)
#  index_articles_on_user_id   (user_id)
#

class Article < ActiveRecord::Base
  # 添加标签的功能  
  acts_as_taggable
  # 标签
  acts_as_taggable_on :tags
  attr_accessible :title, :content, :article_type_id, :tag_list
  belongs_to :admin
  belongs_to :user
  belongs_to :article_type
  default_scope {order('created_at desc')}

  validates :title, presence: true
  validates :content, presence: true, length: { in: 2..600 }
end
