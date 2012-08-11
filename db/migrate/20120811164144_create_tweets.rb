class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user
      t.string :text

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
