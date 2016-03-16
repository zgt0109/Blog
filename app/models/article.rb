# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  admin_id     :integer
#  title        :string
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  article_type :string
#
# Indexes
#
#  index_articles_on_admin_id  (admin_id)
#

class Article < ActiveRecord::Base
  extend Enumerize
  enumerize :article_type, in: [:note, :ad, :it]
  belongs_to :admin
  default_scope {order('created_at desc')}

  validates :title, presence: true
  validates :content, presence: true, length: { in: 2..200 }
end
