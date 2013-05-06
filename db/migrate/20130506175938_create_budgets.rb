class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|

      t.timestamps
    end
  end
end
