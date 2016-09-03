class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.time :scheduled_at
      t.boolean :completed
    end
  end
end
