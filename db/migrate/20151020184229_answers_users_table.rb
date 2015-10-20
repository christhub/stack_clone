class AnswersUsersTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :upvote
      t.integer :downvote
      t.integer :user_id
  end

  add_index :votes, :user_id
end
end
