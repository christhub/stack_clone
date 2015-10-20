class VotesJoinTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :upvotes, :integer
      t.column :downvotes, :integer
      t.references :voted, polymorphic: true, index: true

      t.timestamps
    end
  end
end
