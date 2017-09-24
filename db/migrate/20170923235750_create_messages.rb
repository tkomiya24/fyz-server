class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :sender, references: :users
      t.references :receiver, polymorphic: true
      t.text :text
      t.timestamps
    end
  end
end
