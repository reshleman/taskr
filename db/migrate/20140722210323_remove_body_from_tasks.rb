class RemoveBodyFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :body, :string
  end
end
