# == Schema Information
#
# Table name: article_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleType < ActiveRecord::Base
  has_many :articles
  validates :name, presence: true, length: { in: 2..10 }
  default_scope {order('created_at desc')}
end
