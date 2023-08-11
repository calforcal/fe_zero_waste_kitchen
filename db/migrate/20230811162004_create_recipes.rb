class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instructions, array: true, default: []
      t.string :image_url
      t.integer :cook_time
      t.boolean :public_status, default: true
      t.boolean :user_submitted
      t.string :api_id
      t.string :source_name
      t.string :source_url

      t.timestamps
    end
  end
end
