class CreateLexemes < ActiveRecord::Migration[5.1]
  def change
    create_table :lexemes do |t|
      t.string :headword, null: false

      t.timestamps
    end
  end
end
