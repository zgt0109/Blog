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
  acts_as_paranoid
  # 添加标签的功能
  acts_as_taggable
  # 标签
  acts_as_taggable_on :tags
  belongs_to :admin
  belongs_to :user
  belongs_to :article_type
  default_scope {order('created_at desc')}

  validates :title, presence: true
  validates :content, presence: true, length: { in: 2..600 }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |article|
        csv << article.attributes.values_at(*column_names)  # 将数据插入数组中
      end
    end
  end
end
