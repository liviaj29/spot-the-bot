class AddWebsiteHtmlToWebsiteQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :website_questions, :website_html, :text
  end
end
