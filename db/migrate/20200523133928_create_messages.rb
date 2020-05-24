class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body, required: true
      t.integer :user_id, required:true

      t.timestamps
    end
  end
end
