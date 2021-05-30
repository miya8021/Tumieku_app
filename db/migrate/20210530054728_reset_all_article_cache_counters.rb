class ResetAllArticleCacheCounters < ActiveRecord::Migration[6.1]
  def change
    def up
      Article.find_each { |article| Article.reset_counters(article.id, :likes_count) }
    end

    def down
    end
  end
end
