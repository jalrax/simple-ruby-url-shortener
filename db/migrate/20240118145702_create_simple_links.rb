class CreateSimpleLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :simple_links do |t|
      t.string :url, null: false
      t.string :short_url, null: false
      t.integer :click_count, default: 0

      t.timestamps
    end
  end
end
