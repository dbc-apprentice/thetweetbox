class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :text

      t.timestamps
    end
    add_index :hashtags, :text, :unique => true
  end
end
