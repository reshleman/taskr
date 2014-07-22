class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :body
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
