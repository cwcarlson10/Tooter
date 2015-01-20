class CreateToots < ActiveRecord::Migration
  def change
    create_table :toots do |t|
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
