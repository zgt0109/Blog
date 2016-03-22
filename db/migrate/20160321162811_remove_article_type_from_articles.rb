class RemoveArticleTypeFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :article_type, :string
  end
end
