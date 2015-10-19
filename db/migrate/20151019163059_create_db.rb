class CreateDb < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :question, :string
      t.column :content, :string
      t.column :upvote, :integer
      t.column :downvote, :integer
      t.column :user_id, :integer

      t.timestamps
    end

    create_table :users do |t|
      t.column :name, :string
      t.column :password_digest, :string
    end

    create_table :answers do |t|
      t.column :content, :string
      t.column :upvote, :integer
      t.column :downvote, :integer
      t.column :question_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
end
end
