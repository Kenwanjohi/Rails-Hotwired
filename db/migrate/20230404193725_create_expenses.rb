class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :description
      t.string :amount
      t.datetime :date

      t.timestamps
    end
  end
end
