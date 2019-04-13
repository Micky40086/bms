class CreateBlogTags < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_tags do |t|
      t.references :admin, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
