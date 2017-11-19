class CreateSenses < ActiveRecord::Migration[5.1]
  def change
    create_table :senses do |t|
      t.integer :type
      t.string :content
      t.references :lexeme, foreign_key: true

      t.timestamps
    end
  end
end
