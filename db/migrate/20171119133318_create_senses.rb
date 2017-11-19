class CreateSenses < ActiveRecord::Migration[5.1]
  def change
    create_table :senses do |t|
      t.integer :word_class, null: false
      t.string :content, null: false
      t.boolean :approve, default: false, null: false
      t.references :lexeme, foreign_key: true

      t.timestamps
    end
  end
end
