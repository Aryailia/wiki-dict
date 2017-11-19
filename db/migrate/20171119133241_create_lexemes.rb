class CreateLexemes < ActiveRecord::Migration[5.1]
  def change
    create_table :lexemes do |t|
      t.string :headword

      t.timestamps
    end
  end
end
