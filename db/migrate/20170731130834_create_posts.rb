class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.content :string
      is.published :true

      t.timestamps
    end
  end
end
