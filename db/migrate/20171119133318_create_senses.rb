class CreateSenses < ActiveRecord::Migration[5.1]
  def change
    create_table :senses do |t|
      t.integer :type, null: false
      t.string :content, null: false
      t.boolean :approve, null: false
      t.references :lexeme, foreign_key: true

      t.timestamps
    end
  end
end
